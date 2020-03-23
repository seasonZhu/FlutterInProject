import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Example {
    Example();

    String name;
    Example father;
    List<Example> friends;
    List<String> keywords;
    num age;
    
    factory Example.fromJson(Map<String,dynamic> json) => _$ExampleFromJson(json);
    Map<String, dynamic> toJson() => _$ExampleToJson(this);
}
