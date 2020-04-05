import 'package:json_annotation/json_annotation.dart';

part 'doubanDetails.g.dart';

@JsonSerializable()
class DoubanDetails {
    DoubanDetails();

    @JsonKey(name: '1') double one;
    @JsonKey(name: '2') double two;
    @JsonKey(name: '3') double three;
    @JsonKey(name: '4') double four;
    @JsonKey(name: '5') double five;
    
    factory DoubanDetails.fromJson(Map<String,dynamic> json) => _$DoubanDetailsFromJson(json);
    Map<String, dynamic> toJson() => _$DoubanDetailsToJson(this);
}
