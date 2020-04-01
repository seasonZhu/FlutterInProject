// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanRating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanRating _$DoubanRatingFromJson(Map<String, dynamic> json) {
  return DoubanRating()
    ..max = json['max'] as num
    ..average = json['average'] as num
    ..details = json['details'] == null
        ? null
        : DoubanDetails.fromJson(json['details'] as Map<String, dynamic>)
    ..stars = json['stars'] as String
    ..min = json['min'] as num;
}

Map<String, dynamic> _$DoubanRatingToJson(DoubanRating instance) =>
    <String, dynamic>{
      'max': instance.max,
      'average': instance.average,
      'details': instance.details,
      'stars': instance.stars,
      'min': instance.min
    };
