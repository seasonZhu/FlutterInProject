// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Example _$ExampleFromJson(Map<String, dynamic> json) {
  return Example()
    ..name = json['name'] as String
    ..father = json['father'] == null
        ? null
        : Example.fromJson(json['father'] as Map<String, dynamic>)
    ..friends = (json['friends'] as List)
        ?.map((e) =>
            e == null ? null : Example.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..keywords = (json['keywords'] as List)?.map((e) => e as String)?.toList()
    ..age = json['age'] as num;
}

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'name': instance.name,
      'father': instance.father,
      'friends': instance.friends,
      'keywords': instance.keywords,
      'age': instance.age
    };
