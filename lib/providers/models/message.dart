import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String id;
  String text;
  MessageDirection direction;
  DateTime sentTime;
  String senderId;
  MessageStatus status;
  Message({
    required this.id,
    required this.text,
    required this.sentTime,
    required this.senderId,
    required this.direction,
    required this.status,
  });
  factory Message.fromJson(Map<String, dynamic> data) =>
      _$MessageFromJson(data);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  String sentTimetoString() {
    String _twoDigits(int n) {
      if (n >= 10) return "${n}";
      return "0${n}";
    }

    String min = _twoDigits(sentTime.minute);
    String hour = _twoDigits(sentTime.hour);

    return "$hour:$min";
  }
}

@JsonEnum()
enum MessageDirection {
  unknown,
  incoming,
  outgoing,
}
@JsonEnum()
enum MessageStatus {
  unknown,
  sending,
  sent,
  received,
  read,
  failed,
}
