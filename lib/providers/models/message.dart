import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String text;
  MessageDirection direction;
  DateTime sentTime;

  Message({
    required this.text,
    required this.sentTime,
    required this.direction,
  });
  factory Message.fromJson(Map<String, dynamic> data) =>
      _$MessageFromJson(data);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
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
