import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';
import 'package:yo_chat/providers/models/yo_user.dart';

class CreateConversationPage extends StatelessWidget {
  const CreateConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final conversationController = Get.find<ConversationController>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text("test"),
            onTap: () {
              conversationController.createConversation(YoUser(
                name: "test",
                email: "test",
                uid: "test",
                phoneNumber: "",
              ));
            },
          )
        ],
      ),
    );
  }
}
