import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/providers/models/conversation.dart';

class MessagePage extends StatelessWidget {
  Conversation conversation;

  MessagePage({Key? key, required this.conversation}) : super(key: key);

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
      body: ListView.builder(
          itemCount: conversation.messages.length,
          itemBuilder: (context, index) {
            final message = conversation.messages[index];
            return ListTile(
              title: Text(message.text),
              subtitle: Text(message.sentTime.toString()),
            );
          }),
    );
  }
}
