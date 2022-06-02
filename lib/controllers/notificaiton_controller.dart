import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/providers/fcm_provider.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/providers/models/yo_user.dart';
import 'package:yo_chat/providers/storage_provider.dart';

class NotificationController extends GetxController {
  String? key;
  FcmProvider get provider => Get.find<FcmProvider>();
  AuthenticationController get auth => Get.find<AuthenticationController>();
  FirestoreProvider get store => Get.find<FirestoreProvider>();
  StorageProvider get storage => Get.find<StorageProvider>();

  StreamSubscription<User?>? userDocSub;
  @override
  void onInit() {
    super.onInit();
    var secretFile = File('../data/secret.txt');
    if (secretFile.existsSync()) {
      secretFile.readAsString().then((String contents) {
        key = contents;
      });
    }
    userDocSub = FirebaseAuth.instance.idTokenChanges().listen((event) async {
      if (event != null) {
        var token = await FirebaseMessaging.instance.getToken();
        if (shouldUpdateToken(event.uid, token) == false) return;

        if (store.currentUserDoc == null) return;
        await store.currentUserDoc!.update(fcmToken: token);

        updateLocalDB(event.uid, token);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    userDocSub?.cancel();
  }

  bool shouldUpdateToken(String uid, String? token) {
    var user = storage.readFCMuid();
    if (user != uid) return true;

    var token = storage.readFCM();
    if (token != token) return true;

    var time = storage.readFCMTime();
    if (time == null ||
        time.add(const Duration(days: 15)).isBefore(DateTime.now())) {
      return true;
    }

    return false;
  }

  void updateLocalDB(String uid, String? token) {
    storage.writeFCMuid(uid);
    if (token != null) {
      storage.writeFCM(token);
    }
    storage.writeFCMTime(DateTime.now());
  }

  void _sendNotification(
      {required String to, required String title, required String body}) {
    if (key != null) {
      provider.postNotification(to: to, secret: key!);
    }
  }

  Future<void> sendMessageNotification(String uid, String message) async {
    var currentUser = auth.user.value;
    if (currentUser == null) return;

    var otherUser = (await usersRef.doc(uid).get()).data;
    if (otherUser?.fcmToken == null) return;

    _sendNotification(
        to: otherUser!.fcmToken!,
        title: currentUser.displayName,
        body: message);
  }
}
