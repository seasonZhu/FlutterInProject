import 'package:json_annotation/json_annotation.dart';

part 'doubanImageInfo.g.dart';

@JsonSerializable()
class DoubanImageInfo {
    DoubanImageInfo();

    String small;
    String large;
    String medium;
    
    factory DoubanImageInfo.fromJson(Map<String,dynamic> json) => _$DoubanImageInfoFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanImageInfoToJson(this);
}
