// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanDetails _$DoubanDetailsFromJson(Map<String, dynamic> json) {
  return DoubanDetails()
    ..one = (json['1'] as num)?.toDouble()
    ..two = (json['2'] as num)?.toDouble()
    ..three = (json['3'] as num)?.toDouble()
    ..four = (json['4'] as num)?.toDouble()
    ..five = (json['5'] as num)?.toDouble();
}

Map<String, dynamic> _$DoubanDetailsToJson(DoubanDetails instance) =>
    <String, dynamic>{
      '1': instance.one,
      '2': instance.two,
      '3': instance.three,
      '4': instance.four,
      '5': instance.five
    };
