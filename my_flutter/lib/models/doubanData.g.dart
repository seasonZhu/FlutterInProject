// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanData _$DoubanDataFromJson(Map<String, dynamic> json) {
  return DoubanData()
    ..count = json['count'] as num
    ..start = json['start'] as num
    ..total = json['total'] as num
    ..subjects = (json['subjects'] as List)
        ?.map((e) => e == null
            ? null
            : DoubanSubject.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..title = json['title'] as String;
}

Map<String, dynamic> _$DoubanDataToJson(DoubanData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'total': instance.total,
      'subjects': instance.subjects,
      'title': instance.title
    };
