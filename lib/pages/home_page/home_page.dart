import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';
import 'package:yo_chat/pages/create_conversation_page/create_conversation_page.dart';
import 'package:yo_chat/pages/home_page/home_page_controller.dart';

import '../message_page/message_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomePageController>(HomePageController());
    final conversationController = Get.find<ConversationController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateConversationPage(),
              transition: Transition.cupertino);
        },
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: conversationController.conversations.length,
          itemBuilder: (context, index) {
            final conversation = conversationController.conversations[index];
            return ListTile(
              title: Text(conversation.name),
              leading: CircleAvatar(
                backgroundImage: conversation.photoUrl == null
                    ? null
                    : NetworkImage(conversation.photoUrl!),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (conversation.unreadCount > 0)
                    Text(
                      '${conversation.unreadCount}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(conversation.lastMessage),
                  Text(
                    conversation.lastMessageTime.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onTap: () {
                Get.to(() => DetailsPage());
              },
            );
          },
        ),
      ),
    );
  }
}
