import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/providers/firebase_authentication_provider.dart';
import 'package:yo_chat/providers/models/yo_user.dart';
import 'package:yo_chat/providers/models/collections.dart';
import 'package:yo_chat/providers/models/message.dart';

import 'models/conversation.dart';

class FirestoreProvider extends GetxService {
  FirebaseAuthenticationProvider get authProvider =>
      Get.find<FirebaseAuthenticationProvider>();

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  YoUserDocumentReference? get currentUserDoc =>
      authProvider.isLoggedIn ? usersRef.doc(authProvider.user!.uid) : null;

  Stream<ConversationQuerySnapshot>? userConversationsStream() {
    if (authProvider.isLoggedIn == false) return null;
    var stream = usersRef.doc(authProvider.user!.uid).conversations.snapshots();
    return stream;
  }

  /// Creates a new conversation document under current user's subdocument
  Future<void> createConversation(Conversation conversation) async {
    if (currentUserDoc != null) {
      var current =
          await currentUserDoc!.conversations.doc(conversation.id).get();
      if (current.exists) throw Error();
      current.reference.set(conversation);
    }
  }

  Stream<YoUserDocumentSnapshot>? userDocumentStream() {
    if (authProvider.isLoggedIn == false) return null;
    var stream = usersRef.doc(authProvider.user!.uid).snapshots();
    return stream;
  }

  /// creates a new user document if document not exists
  Future<bool> createUserDocument(YoUser user) async {
    var current = await usersRef.doc(user.uid).get();
    if (current.exists) return false;
    await current.reference.set(user);
    return true;
  }

  Future<List<YoUser>> getUsers() async {
    var usersSnaps = await usersRef.get();
    return usersSnaps.docs.map((e) => e.data).toList();
  }
}
