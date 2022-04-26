import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yo_chat/providers/firestore_provider.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

class FirebaseAuthenticationProvider extends GetxService {
  FirebaseAuth get _auth => FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  bool get isLoggedIn => _auth.currentUser != null;
}
