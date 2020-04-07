import 'package:json_annotation/json_annotation.dart';
import "doubanRating.dart";
import "doubanPersonInfo.dart";
import "doubanImageInfo.dart";
part 'doubanSubject.g.dart';

@JsonSerializable()
class DoubanSubject {
    DoubanSubject();

    DoubanRating rating;
    List<String> genres;
    String title;
    List<DoubanPersonInfo> casts;
    List<String> durations;
    @JsonKey(name: 'collect_count') int collectCount;
    @JsonKey(name: 'mainland_pubdate') String mainlandPubdate;
    @JsonKey(name: 'has_video') bool hasVideo;
    @JsonKey(name: 'original_title') String originalTitle;
    String subtype;
    List<DoubanPersonInfo> directors;
    List<String> pubdates;
    String year;
    DoubanImageInfo images;
    String alt;
    String id;
    
    factory DoubanSubject.fromJson(Map<String,dynamic> json) => _$DoubanSubjectFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanSubjectToJson(this);
}
