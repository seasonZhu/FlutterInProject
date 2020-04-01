import 'package:json_annotation/json_annotation.dart';
import "doubanDetails.dart";
part 'doubanRating.g.dart';

@JsonSerializable()
class DoubanRating {
    DoubanRating();

    num max;
    num average;
    DoubanDetails details;
    String stars;
    num min;
    
    factory DoubanRating.fromJson(Map<String,dynamic> json) => _$DoubanRatingFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanRatingToJson(this);
}
