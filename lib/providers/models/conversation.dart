import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:get/get.dart';
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
  @JsonKey(ignore: true)
  var displayName = "".obs;
  Conversation({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.phoneNumber,
    this.lastMessage = "",
    this.lastMessageTime,
    this.unreadCount = 0,
  }) {
    setDisplayName();
  }

  Future<void> setDisplayName() async {
    if (name.isNotEmpty) {
      displayName.value = name;
      return;
    } else {
      var userName =
          await usersRef.doc(id).get().then((value) => value.data?.name);
      if (userName != null && userName.isNotEmpty) {
        displayName.value = userName;
        return;
      }

      displayName.value = phoneNumber ?? "";
    }
  }

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
