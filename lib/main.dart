import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/FirebaseController.dart';

import 'pages/home_page/home_page.dart';

void main() {
  initializeControllers();
  runApp(const MyApp());
}

void initializeControllers() {
  Get.lazyPut<FirebaseController>(() => FirebaseController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        darkTheme: ThemeData.dark(),
        title: 'Yo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}
