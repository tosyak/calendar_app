// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventModel _$EventModelFromJson(Map<String, dynamic> json) => _EventModel(
  eventName: json['event_name'] as String,
  description: json['description'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$EventModelToJson(_EventModel instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'description': instance.description,
      'date': instance.date,
    };
