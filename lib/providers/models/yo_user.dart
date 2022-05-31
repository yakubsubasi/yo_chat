import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yo_chat/providers/models/conversation.dart';
import 'message.dart';
// This doesn't exist yet...! See "Next Steps"
part 'yo_user.g.dart';

@JsonSerializable(explicitToJson: true)
class YoUser {
  YoUser({
    required this.name,
    required this.email,
    this.photoUrl,
    required this.uid,
    required this.phoneNumber,
  });

  final String name;
  final String email;
  final String? photoUrl;
  final String phoneNumber;
  final String uid;
}

@Collection<YoUser>('yo_users')
@Collection<Conversation>('yo_users/*/conversations', name: "conversations")
@Collection<Message>('yo_users/*/conversations/*/messages', name: "messages")
final usersRef = YoUserCollectionReference();
