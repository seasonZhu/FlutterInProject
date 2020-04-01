// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanPersonInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanPersonInfo _$DoubanPersonInfoFromJson(Map<String, dynamic> json) {
  return DoubanPersonInfo()
    ..avatars = json['avatars'] as Map<String, dynamic>
    ..name_en = json['name_en'] as String
    ..name = json['name'] as String
    ..alt = json['alt'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$DoubanPersonInfoToJson(DoubanPersonInfo instance) =>
    <String, dynamic>{
      'avatars': instance.avatars,
      'name_en': instance.name_en,
      'name': instance.name,
      'alt': instance.alt,
      'id': instance.id
    };
