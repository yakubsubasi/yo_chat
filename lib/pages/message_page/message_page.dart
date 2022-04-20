import 'package:flutter/material.dart';
import 'package:yo_chat/providers/models/message.dart';

class DetailsPage extends StatelessWidget {
   DetailsPage({Key? key}) : super(key: key);
   List<Message> _list = [
    // random messages
    Message(
      id: '1',
      text: 'Merhaba',
      direction: MessageDirection.incoming,
      sentTime: DateTime.now(),
      senderId: '1',
      status: MessageStatus.sent,
    ),
    Message(
      id: '2',
      text: 'Merhaba',
      direction: MessageDirection.incoming,
      sentTime: DateTime.now(),
      senderId: '1',
      status: MessageStatus.sent,
    ),
    Message(
      id: '3',
      text: 'Merhaba',
      direction: MessageDirection.incoming,
      sentTime: DateTime.now(),
      senderId: '1',
      status: MessageStatus.sent,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: const Center(
        child: Text("Detail Page"),
      ),
    );
  }
}
