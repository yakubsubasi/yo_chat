import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';
import 'package:yo_chat/pages/create_conversation_page/create_conversation_page.dart';
import 'package:yo_chat/pages/home_page/home_page_controller.dart';
import 'package:yo_chat/pages/home_page/widgets/homapage_floatin_action_button.dart';
import 'package:yo_chat/providers/models/message.dart';

import '../../providers/models/conversation.dart';
import '../chat_page/chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<HomePageController>(HomePageController());
    final conversationController = Get.find<ConversationController>();

    // TEST
    final Conversation a = Conversation(
      id: "d",
      name: "d",
      messages: List.generate(
          20,
          (index) => Message(
                id: "",
                direction: index % 2 == 1
                    ? MessageDirection.outgoing
                    : MessageDirection.incoming,
                text: "Merhaba nasılsın",
                sentTime: DateTime.now().add(Duration(minutes: index)),
                senderId: '',
                status: MessageStatus.sent,
              )),
      phoneNumber: '',
      photoUrl: '',
    );
    conversationController.conversations.add(a);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yo Chat'),
      ),
      floatingActionButton: HomePageFab(),
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
                Get.to(() => ChatPage(conversation: conversation));
              },
            );
          },
        ),
      ),
    );
  }
}
