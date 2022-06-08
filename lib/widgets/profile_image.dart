import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/conversation_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key, this.photoURL, this.enable = false})
      : super(key: key);

  final bool enable;
  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    final ConversationController conversationController = Get.find();
    var defaultPath = conversationController.defaultImagePath();
    //Eğer var olan resim ve default resim valid değilse patlamaması için check
    if (Uri.tryParse(defaultPath)?.hasAbsolutePath ??
        false || (Uri.tryParse(photoURL ?? "")?.hasAbsolutePath ?? false)) {
      return GestureDetector(
        onTap: enable
            ? () {
                Get.to(() => Dialog(
                      child: Hero(
                        tag: photoURL ?? defaultPath,
                        child: Container(
                            child: Image.network(photoURL ?? defaultPath)),
                      ),
                    ));
              }
            : null,
        child: Hero(
          tag: photoURL ?? defaultPath,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              photoURL ?? defaultPath,
            ),
          ),
        ),
      );
    } else {
      return const CircleAvatar();
    }
  }
}
