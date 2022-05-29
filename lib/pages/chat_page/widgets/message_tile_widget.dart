import 'package:flutter/material.dart';

import '../../../providers/models/message.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
          alignment: message.direction == MessageDirection.incoming
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: message.direction == MessageDirection.incoming
                    ? Colors.grey[300]
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                      color: message.direction == MessageDirection.incoming
                          ? Colors.black
                          : Colors.white),
                ),
                Text(
                  message.sentTimetoString(),
                  style: TextStyle(
                      fontSize: 10,
                      color: message.direction == MessageDirection.incoming
                          ? Colors.black
                          : Colors.grey[350]),
                ),
              ],
            ),
          )),
    );
  }
}
