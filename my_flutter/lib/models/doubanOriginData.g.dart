// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanOriginData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanOriginData _$DoubanOriginDataFromJson(Map<String, dynamic> json) {
  return DoubanOriginData()
    ..count = json['count'] as num
    ..start = json['start'] as num
    ..total = json['total'] as num
    ..subjects = json['subjects'] as List
    ..title = json['title'] as String;
}

Map<String, dynamic> _$DoubanOriginDataToJson(DoubanOriginData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'subjects': instance.subjects,
      'title': instance.title
    };
