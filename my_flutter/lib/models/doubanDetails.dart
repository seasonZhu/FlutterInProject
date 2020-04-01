import 'package:json_annotation/json_annotation.dart';

part 'doubanDetails.g.dart';

@JsonSerializable()
class DoubanDetails {
    DoubanDetails();

    @JsonKey(name: '1') int one;
    @JsonKey(name: '2') int two;
    @JsonKey(name: '3') int three;
    @JsonKey(name: '4') int four;
    @JsonKey(name: '5') int five;
    
    factory DoubanDetails.fromJson(Map<String,dynamic> json) => _$DoubanDetailsFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanDetailsToJson(this);
}
