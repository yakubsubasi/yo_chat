import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class YoUser {
  String displayName;
  String email;
  String photoUrl;
  String uid;
  String phoneNumber;
  YoUser({
    required this.displayName,
    required this.email,
    required this.photoUrl,
    required this.uid,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'uid': uid,
      'phoneNumber': phoneNumber,
    };
  }

  factory YoUser.fromMap(Map<String, dynamic> map) {
    return YoUser(
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory YoUser.fromJson(String source) => YoUser.fromMap(json.decode(source));
}

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
    required this.sentTime,
    required this.senderId,
    required this.direction,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'sentTime': sentTime.millisecondsSinceEpoch,
      'senderId': senderId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      sentTime: DateTime.fromMillisecondsSinceEpoch(map['sentTime']),
      senderId: map['senderId'] ?? '',
      direction: map['direction'] != null
          ? MessageDirection.values[map['direction']]
          : MessageDirection.unknown,
      status: map['status'] != null
          ? MessageStatus.values[map['status']]
          : MessageStatus.unknown,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}

enum MessageDirection {
  unknown,
  incoming,
  outgoing,
}

enum MessageStatus {
  unknown,
  sending,
  sent,
  received,
  read,
  failed,
}

class Conversation {
  String id;
  String name;
  String photoUrl;
  String lastMessage;
  DateTime lastMessageTime;
  int unreadCount;
  Conversation({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      'unreadCount': unreadCount,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: DateTime.fromMillisecondsSinceEpoch(
        map['lastMessageTime'],
      ),
      unreadCount: map['unreadCount'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source));
}

class ConversationDetail {
  String id;
  String name;
  String photoUrl;
  String lastMessage;
  DateTime lastMessageTime;
  int unreadCount;
  List<Message> messages;
  ConversationDetail({
    required this.id,
    required this.name,
    required this.photoUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadCount,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'photoUrl': photoUrl,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      'unreadCount': unreadCount,
      'messages': messages.map((e) => e.toMap()).toList(),
    };
  }

  factory ConversationDetail.fromMap(Map<String, dynamic> map) {
    return ConversationDetail(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: DateTime.fromMillisecondsSinceEpoch(
        map['lastMessageTime'],
      ),
      unreadCount: map['unreadCount'] ?? 0,
      messages: List<Message>.from(
        map['messages'].map((x) => Message.fromMap(x)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationDetail.fromJson(String source) =>
      ConversationDetail.fromMap(json.decode(source));
}
