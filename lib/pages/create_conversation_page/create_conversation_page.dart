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
      body: FutureBuilder<List<YoUser>>(
          future: conversationController.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView(
                children: [
                  ...data.map(
                    (e) => ListTile(
                      title: Text(e.phoneNumber),
                      onTap: () {
                        conversationController.createConversation(e);
                      },
                    ),
                  )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
