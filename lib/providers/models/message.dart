class Message {
  
  String id;
  String text;
  MessageDirection direction;
  DateTime sentTime;
  String senderId;
  MessageStatus status;

  Message({
    required this.id,
    required this.text,
    required this.direction,
    required this.sentTime,
    required this.senderId,
    required this.status,
  });


}

enum MessageDirection {
  incoming,
  outgoing,
}

enum MessageStatus {
  sending,
  sent,
  received,
  read,
  failed,
}