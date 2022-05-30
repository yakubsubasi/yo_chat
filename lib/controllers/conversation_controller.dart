import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

import '../providers/models/conversation.dart';

class ConversationController extends GetxController {
  final conversations = <Conversation>[].obs;
  FirestoreProvider get firestoreProvider => Get.find();
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

  void createConversation(YoUser user) {
    var conversation = Conversation.fromUser(user);
    firestoreProvider.createConversation(conversation);
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
}
