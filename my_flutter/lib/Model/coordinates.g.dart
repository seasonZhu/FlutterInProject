// GENERATED CODE - DO NOT MODIFY BY HAND

/* 
Dart没有Swift中那样的Codable协议或者像Java中的反射
一般是通过json_serializable框架进行脚本化的编写
会生成与模型文件名.dart对应的模型文件名.g.dart文件
而且如果之前有生成过其他模型的.g.dart文件,build_runner可能会报错
需要找到更好的解决方案,大致思路知道了
 */

part of 'coordinates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };
