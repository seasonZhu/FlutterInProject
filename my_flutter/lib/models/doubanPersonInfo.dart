import 'package:json_annotation/json_annotation.dart';

part 'doubanPersonInfo.g.dart';

@JsonSerializable()
class DoubanPersonInfo {
    DoubanPersonInfo();

    Map<String,dynamic> avatars;
    String name_en;
    String name;
    String alt;
    String id;
    
    factory DoubanPersonInfo.fromJson(Map<String,dynamic> json) => _$DoubanPersonInfoFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanPersonInfoToJson(this);
}
