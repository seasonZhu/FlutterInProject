import 'package:json_annotation/json_annotation.dart';

part 'doubanOriginData.g.dart';

@JsonSerializable()
class DoubanOriginData {
    DoubanOriginData();

    num count;
    num start;
    num total;
    List subjects;
    String title;
    
    factory DoubanOriginData.fromJson(Map<String,dynamic> json) => _$DoubanOriginDataFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanOriginDataToJson(this);
}
