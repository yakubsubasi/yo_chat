import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/FirebaseController.dart';

import '../message_page/message_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FirebaseController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yo App'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.conversations.length,
          itemBuilder: (context, index) {
            final conversation = controller.conversations[index];
            return ListTile(
              title: Text(conversation.name),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(conversation.photoUrl),
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
