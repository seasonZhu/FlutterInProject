import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable()
class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  //反序列化
  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}