// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landmark _$LandmarkFromJson(Map<String, dynamic> json) {
  return Landmark(
      id: json['id'] as int,
      name: json['name'] as String,
      imageName: json['imageName'] as String,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      state: json['state'] as String,
      park: json['park'] as String);
}

Map<String, dynamic> _$LandmarkToJson(Landmark instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageName': instance.imageName,
      'coordinates': instance.coordinates,
      'state': instance.state,
      'park': instance.park
    };
