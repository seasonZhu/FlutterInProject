import 'package:json_annotation/json_annotation.dart';

import 'coordinates.dart';

part 'landmark.g.dart';

@JsonSerializable()
class Landmark {
  final int id;
  final String name;
  final String imageName;
  final Coordinates coordinates;
  final String state;
  final String park;

  Landmark({
    this.id,
    this.name,
    this.imageName,
    this.coordinates,
    this.state,
    this.park,
  });

  //反序列化
  factory Landmark.fromJson(Map<String, dynamic> json) => _$LandmarkFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$LandmarkToJson(this);
}