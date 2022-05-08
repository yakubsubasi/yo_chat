import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/pages/create_conversation_page/create_conversation_page.dart';
import 'dart:math' as math;

class HomePageFab extends StatelessWidget {
  const HomePageFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.message),
      onPressed: () {
        Get.to(() => CreateConversationPage(),
            transition: Transition.cupertino);
      },
    );
  }
}
