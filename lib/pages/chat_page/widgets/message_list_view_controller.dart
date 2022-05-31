import 'dart:async';

import 'package:get/get.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/providers/models/message.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

class MessageListViewController extends GetxController {
  final messages = <Message>[].obs;

  final String conversationId;

  MessageListViewController({required this.conversationId});

  MessageCollectionReference get ref => Get.find<FirestoreProvider>()
      .currentUserDoc!
      .conversations
      .doc(conversationId)
      .messages;

  late StreamSubscription<MessageQuerySnapshot> subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = ref.snapshots().listen((event) {
      messages.value = event.docs.map((e) => e.data).toList()
        ..sort((a, b) => b.sentTime.compareTo(a.sentTime));
    });
  }

  @override
  void onClose() {
    super.onClose();
    subscription.cancel();
  }
}
