// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      text: json['text'] as String,
      sentTime: DateTime.parse(json['sentTime'] as String),
      senderId: json['senderId'] as String,
      direction: $enumDecode(_$MessageDirectionEnumMap, json['direction']),
      status: $enumDecode(_$MessageStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'direction': _$MessageDirectionEnumMap[instance.direction],
      'sentTime': instance.sentTime.toIso8601String(),
      'senderId': instance.senderId,
      'status': _$MessageStatusEnumMap[instance.status],
    };

const _$MessageDirectionEnumMap = {
  MessageDirection.unknown: 'unknown',
  MessageDirection.incoming: 'incoming',
  MessageDirection.outgoing: 'outgoing',
};

const _$MessageStatusEnumMap = {
  MessageStatus.unknown: 'unknown',
  MessageStatus.sending: 'sending',
  MessageStatus.sent: 'sent',
  MessageStatus.received: 'received',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};
