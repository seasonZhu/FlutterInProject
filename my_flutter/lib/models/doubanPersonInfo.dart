import 'package:json_annotation/json_annotation.dart';

part 'doubanPersonInfo.g.dart';

@JsonSerializable()
class DoubanPersonInfo {
    DoubanPersonInfo();

    Map<String,dynamic> avatars;
    @JsonKey(name: 'name_en') String nameEn;
    String name;
    String alt;
    String id;
    
    factory DoubanPersonInfo.fromJson(Map<String,dynamic> json) => _$DoubanPersonInfoFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanPersonInfoToJson(this);
}
