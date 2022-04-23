import 'dart:math';

import 'package:get/get.dart';
import 'package:yo_chat/providers/random_user_provider.dart';

import 'models/message.dart';

class FirebaseController extends GetxController {
  final conversations = <Conversation>[].obs;

  final randomUserProvider = RandomUserProvider();

  @override
  Future<void> onInit() async {
    super.onInit();
    var temp = <Conversation>[];
    for (var i = 0; i < 10; i++) {
      temp.add(Conversation(
        name: await randomUserProvider.getRandomName(),
        photoUrl:
            "https://randomuser.me/api/portraits/thumb/men/${Random().nextInt(100)}.jpg",
        lastMessage: 'Hey, how are you?',
        lastMessageTime: DateTime.now(),
        unreadCount: Random().nextInt(10),
        id: '',
      ));
    }
    conversations.addAll(temp);
  }

  List<Conversation> _getConversations() {
    //generate Random conversations

    return [
      Conversation(
          id: '1',
          name: 'Yakub Subaşı',
          lastMessage: 'Merhaba',
          lastMessageTime: DateTime.now(),
          unreadCount: 0,
          photoUrl:
              "https://randomuser.me/api/portraits/thumb/men/${Random().nextInt(100)}.jpg"),
      Conversation(
        id: '2',
        name: 'Yakub Subaşı',
        lastMessage: 'Merhaba',
        lastMessageTime: DateTime.now(),
        unreadCount: 0,
        photoUrl:
            "https://randomuser.me/api/portraits/thumb/men/${Random().nextInt(100)}.jpg",
      ),
      Conversation(
        id: '3',
        name: 'Yakub Subaşı',
        lastMessage: 'Merhaba',
        lastMessageTime: DateTime.now(),
        unreadCount: 0,
        photoUrl:
            "https://randomuser.me/api/portraits/thumb/men/${Random().nextInt(100)}.jpg",
      ),
    ];
  }
}
