import 'package:json_annotation/json_annotation.dart';
import "doubanSubject.dart";
part 'doubanData.g.dart';

@JsonSerializable()
class DoubanData {
    DoubanData();

    num count;
    num start;
    num total;
    List<DoubanSubject> subjects;
    String title;
    
    factory DoubanData.fromJson(Map<String,dynamic> json) => _$DoubanDataFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanDataToJson(this);
}
