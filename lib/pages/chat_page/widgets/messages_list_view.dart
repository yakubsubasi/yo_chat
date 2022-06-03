import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:yo_chat/pages/chat_page/widgets/message_list_view_controller.dart';

import '../../../providers/models/conversation.dart';
import '../../../providers/models/message.dart';
import 'message_tile_widget.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<MessageListViewController>(
        MessageListViewController(conversationId: conversation.id));
    return Obx(
      () => GroupedListView<Message, DateTime>(
        useStickyGroupSeparators: true,
        floatingHeader: true,
        reverse: true,
        itemComparator: (a, b) => a.sentTime.compareTo(b.sentTime),
        order: GroupedListOrder.DESC,
        elements: controller.messages.value,
        groupHeaderBuilder: (Message message) => SizedBox(
          height: 40,
          child: Center(
              child: Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(DateFormat.yMMMd().format(message.sentTime)),
            ),
          )),
        ),
        groupBy: (element) => DateTime(element.sentTime.year,
            element.sentTime.month, element.sentTime.day),
        itemBuilder: (context, Message message) =>
            MessageTile(message: message),
      ),
    );
  }
}
