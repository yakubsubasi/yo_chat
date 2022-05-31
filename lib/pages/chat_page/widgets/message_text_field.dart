import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yo_chat/controllers/remote_config_controller.dart';

class MessageTextField extends StatefulWidget {
  const MessageTextField({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function(String message) onPressed;

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final RemoteConfigController config = Get.find();
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 8, 16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: config.getMessageTextFieldHint(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () => widget.onPressed(controller.value.text),
            icon: const Icon(Icons.send),
          ),
        )
      ],
    );
  }
}
