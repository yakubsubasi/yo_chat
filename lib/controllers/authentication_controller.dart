import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/pages/home_page/home_page.dart';
import 'package:yo_chat/pages/login_page/login_page.dart';
import 'package:yo_chat/pages/verify_phone_number_page/verify_phone_number_page.dart';
import 'package:yo_chat/providers/firebase_authentication_provider.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/widgets/verify_phone_number_dialog.dart';

import '../providers/models/yo_user.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuthenticationProvider provider =
      Get.find<FirebaseAuthenticationProvider>();
  final FirestoreProvider storeProvider = Get.find<FirestoreProvider>();

  var user = Rx<YoUser?>(null);
  bool get isLoggedIn => provider.isLoggedIn;
  FirebaseAuth get _auth => FirebaseAuth.instance;
  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<YoUserDocumentSnapshot>? _docSubscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    _authSubscription = _auth.authStateChanges().listen((user) async {
      if (user != null) {
        await storeProvider.createUserDocument(YoUser(
          name: user.displayName ?? "",
          email: user.email ?? "",
          uid: user.uid,
          photoUrl: user.photoURL,
          phoneNumber: user.phoneNumber ?? "",
        ));
        _subscribe();
      } else {
        this.user.value = null;
      }
    });
    _subscribe();
    //await _auth.signOut();
  }

  void _subscribe() {
    var stream = storeProvider.userDocumentStream();
    if (stream != null) {
      _docSubscription = stream.listen((event) {
        user.value = event.data;
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    _authSubscription?.cancel();
    _docSubscription?.cancel();
  }

  Future<void> login(String phoneNumber) async {
    if (_auth.currentUser != null) {
      throw Exception('An User Already Logged In');
    }

    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential credential) {
        _signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) async {
        Get.offAll(() => const LoginPage());
        Get.dialog(Dialog(child: const Text("Failed to verify phone number")));
      },
      codeSent: (String verificationId, int? resendToken) async {
        var code = await Get.to<String>(() => const VerifyPhoneNumberPage());
        if (code == null) throw Exception();
        var credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: code);
        _signInWithCredential(credential);
        Get.offAll(() => const HomePage());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _signInWithCredential(AuthCredential credential) {
    _auth.signInWithCredential(credential);
  }
}
