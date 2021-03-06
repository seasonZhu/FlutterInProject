// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doubanSubject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoubanSubject _$DoubanSubjectFromJson(Map<String, dynamic> json) {
  return DoubanSubject()
    ..rating = json['rating'] == null
        ? null
        : DoubanRating.fromJson(json['rating'] as Map<String, dynamic>)
    ..genres = (json['genres'] as List)?.map((e) => e as String)?.toList()
    ..title = json['title'] as String
    ..casts = (json['casts'] as List)
        ?.map((e) => e == null
            ? null
            : DoubanPersonInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..durations = (json['durations'] as List)?.map((e) => e as String)?.toList()
    ..collectCount = json['collect_count'] as int
    ..mainlandPubdate = json['mainland_pubdate'] as String
    ..hasVideo = json['has_video'] as bool
    ..originalTitle = json['original_title'] as String
    ..subtype = json['subtype'] as String
    ..directors = (json['directors'] as List)
        ?.map((e) => e == null
            ? null
            : DoubanPersonInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..pubdates = (json['pubdates'] as List)?.map((e) => e as String)?.toList()
    ..year = json['year'] as String
    ..images = json['images'] == null
        ? null
        : DoubanImageInfo.fromJson(json['images'] as Map<String, dynamic>)
    ..alt = json['alt'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$DoubanSubjectToJson(DoubanSubject instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'genres': instance.genres,
      'title': instance.title,
      'casts': instance.casts,
      'durations': instance.durations,
      'collect_count': instance.collectCount,
      'mainland_pubdate': instance.mainlandPubdate,
      'has_video': instance.hasVideo,
      'original_title': instance.originalTitle,
      'subtype': instance.subtype,
      'directors': instance.directors,
      'pubdates': instance.pubdates,
      'year': instance.year,
      'images': instance.images,
      'alt': instance.alt,
      'id': instance.id
    };
