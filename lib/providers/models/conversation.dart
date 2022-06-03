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
  var displayPhotoURL = RxnString();
  Conversation({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.phoneNumber,
    this.lastMessage = "",
    this.lastMessageTime,
    this.unreadCount = 0,
  }) {
    setDisplayNameAndPhoto();
  }

  Future<void> setDisplayNameAndPhoto() async {
    var user = await usersRef.doc(id).get().then((value) => value.data);

    if (name.isNotEmpty) {
      displayName.value = name;
    } else {
      var userName = user?.displayName;
      if (userName != null && userName.isNotEmpty) {
        displayName.value = userName;
      }
    }

    displayPhotoURL.value = photoUrl ?? user?.photoUrl;
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
