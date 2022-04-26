import 'package:json_annotation/json_annotation.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

import 'message.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  String id;
  String name;
  String? phoneNumber;
  String? photoUrl;
  String lastMessage;
  DateTime? lastMessageTime;
  int unreadCount;
  List<Message> messages;
  Conversation({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.phoneNumber,
    this.lastMessage = "",
    this.lastMessageTime,
    this.unreadCount = 0,
    this.messages = const [],
  });
  factory Conversation.fromJson(Map<String, dynamic> data) =>
      _$ConversationFromJson(data);
  factory Conversation.fromUser(YoUser user) => Conversation(
        id: user.uid,
        name: user.name,
        photoUrl: user.photoUrl,
        phoneNumber: user.phoneNumber,
      );
  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
