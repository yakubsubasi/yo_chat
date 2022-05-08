import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/authentication_controller.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';
import 'package:yo_chat/firebase_options.dart';
import 'package:yo_chat/providers/firebase_authentication_provider.dart';
import 'package:yo_chat/providers/firestore_provider.dart';

import 'pages/home_page/home_page.dart';
import 'pages/login_page/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeProviders();
  initializeControllers();
  runApp(const MyApp());
}

void initializeControllers() {
  Get.lazyPut(() => AuthenticationController());
  Get.lazyPut(() => ConversationController());
}

void initializeProviders() {
  Get.lazyPut(() => FirebaseAuthenticationProvider());
  Get.lazyPut(() => FirestoreProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthenticationController>();

    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      title: 'Yo Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: controller.isLoggedIn ? const HomePage() : const LoginPage(),
    );
  }
}
