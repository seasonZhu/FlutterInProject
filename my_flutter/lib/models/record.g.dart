// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record()
    ..eachSOC = json['eachSOC'] as String
    ..startSOC = json['startSOC'] as String
    ..endSOC = json['endSOC'] as String
    ..startDay = json['startDay'] as String
    ..startTime = json['startTime'] as String
    ..endTime = json['endTime'] as String
    ..duration = json['duration'] as String;
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'eachSOC': instance.eachSOC,
      'startSOC': instance.startSOC,
      'endSOC': instance.endSOC,
      'startDay': instance.startDay,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'duration': instance.duration
    };
