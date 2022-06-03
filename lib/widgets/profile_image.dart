import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, this.photoURL}) : super(key: key);

  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    final ConversationController conversationController = Get.find();
    var defaultPath = conversationController.defaultImagePath();
    //Eğer var olan resim ve default resim valid değilse patlamaması için check
    if (Uri.tryParse(defaultPath)?.hasAbsolutePath ??
        false || (Uri.tryParse(photoURL ?? "")?.hasAbsolutePath ?? false)) {
      return CircleAvatar(
        backgroundImage: NetworkImage(
          photoURL ?? defaultPath,
        ),
      );
    } else {
      return const CircleAvatar();
    }
  }
}
