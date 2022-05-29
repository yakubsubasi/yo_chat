import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/providers/models/conversation.dart';
import 'widgets/message_text_field.dart';
import 'widgets/messages_list_view.dart';

class ChatPage extends StatelessWidget {
  Conversation conversation;

  ChatPage({Key? key, required this.conversation}) : super(key: key);

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: ElevatedButton(
          style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
          onPressed: (() {
            Get.back();
          }),
          child: Row(
            children: [Icon(Icons.arrow_back_ios), CircleAvatar()],
          ),
        ),
        title: Text('${conversation.name}'),
      ),
      body: Column(
        children: [
          Expanded(child: MessagesListView(conversation: conversation)),
          MessageTextField(onPressed: () {})
        ],
      ),
    );
  }
}
