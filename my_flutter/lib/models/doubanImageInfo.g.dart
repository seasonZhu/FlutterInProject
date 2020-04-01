// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanImageInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanImageInfo _$DoubanImageInfoFromJson(Map<String, dynamic> json) {
  return DoubanImageInfo()
    ..small = json['small'] as String
    ..large = json['large'] as String
    ..medium = json['medium'] as String;
}

Map<String, dynamic> _$DoubanImageInfoToJson(DoubanImageInfo instance) =>
    <String, dynamic>{
      'small': instance.small,
      'large': instance.large,
      'medium': instance.medium
    };
