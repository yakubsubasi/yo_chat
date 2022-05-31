import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/controllers/remote_config_controller.dart';
import 'package:yo_chat/pages/chat_page/chat_page.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/providers/models/message.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

import '../providers/models/conversation.dart';

class ConversationController extends GetxController {
  final conversations = <Conversation>[].obs;
  FirestoreProvider get firestoreProvider => Get.find();
  RemoteConfigController get config => Get.find();
  StreamSubscription<ConversationQuerySnapshot>? _subscription;
  StreamSubscription<User?>? _authSubscription;

  void _onConversationsChange(ConversationQuerySnapshot snapshot) {
    conversations.value = snapshot.docs.map((e) => e.data).toList();
  }

  @override
  void onInit() {
    super.onInit();
    _subscribe();
    _authSubscription = FirebaseAuth.instance.idTokenChanges().listen((token) {
      _unsubscribe();
      if (token != null) {
        _subscribe();
      }
    });
  }

  String defaultImagePath() {
    return config.getDefaultImagePath();
  }

  void _subscribe() {
    var stream = firestoreProvider.userConversationsStream();
    if (stream != null) {
      _subscription = stream.listen(_onConversationsChange);
    }
  }

  @override
  void onClose() {
    super.onClose();
    _unsubscribe();
    _authSubscription?.cancel();
  }

  void _unsubscribe() {
    _subscription?.cancel();
  }

  Future<void> createConversation(YoUser user) async {
    var conversation = Conversation.fromUser(user);
    var current = await firestoreProvider.createConversation(conversation);
    Get.to(() => ChatPage(conversation: current));
  }

  Future<List<YoUser>> getUsers() async {
    var users = await firestoreProvider.getUsers();
    users = _removeSelf(users);

    return users;
  }

  List<YoUser> _removeSelf(List<YoUser> users) {
    var uid = Get.find<AuthenticationController>().user.value?.uid;
    if (uid == null) throw Error();

    return users.where((element) => element.uid != uid).toList();
  }

  Future<void> sendMessage(Conversation conversation, String message) async {
    var userDoc = Get.find<FirestoreProvider>().currentUserDoc;
    if (userDoc != null) {
      var myConversation = userDoc.conversations.doc(conversation.id);
      var messageTime = DateTime.now();

      await myConversation.messages.add(
        Message(
            text: message,
            sentTime: messageTime,
            direction: MessageDirection.outgoing),
      );
      myConversation.reference.update({
        "lastMessageTime": messageTime.toIso8601String(),
        "lastMessage": message
      });

      var otherConversation =
          usersRef.doc(conversation.id).conversations.doc(userDoc.id);

      otherConversation.reference.update({
        "lastMessageTime": messageTime.toIso8601String(),
        "lastMessage": message
      });
      await otherConversation.messages.add(
        Message(
            text: message,
            sentTime: messageTime,
            direction: MessageDirection.incoming),
      );
    }
  }
}
