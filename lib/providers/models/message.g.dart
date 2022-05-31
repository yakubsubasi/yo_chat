// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      text: json['text'] as String,
      sentTime: DateTime.parse(json['sentTime'] as String),
      direction: $enumDecode(_$MessageDirectionEnumMap, json['direction']),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'direction': _$MessageDirectionEnumMap[instance.direction],
      'sentTime': instance.sentTime.toIso8601String(),
    };

const _$MessageDirectionEnumMap = {
  MessageDirection.unknown: 'unknown',
  MessageDirection.incoming: 'incoming',
  MessageDirection.outgoing: 'outgoing',
};
