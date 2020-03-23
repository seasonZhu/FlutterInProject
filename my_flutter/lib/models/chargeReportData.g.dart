// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chargeReportData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeReportData _$ChargeReportDataFromJson(Map<String, dynamic> json) {
  return ChargeReportData()
    ..totalDuration = json['totalDuration'] as String
    ..totalSOC = json['totalSOC'] as String
    ..totalCount = json['totalCount'] as String
    ..baseY = json['baseY'] as String
    ..positionY = json['positionY'] as String
    ..record = (json['record'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..avgSOC = json['avgSOC'] as String
    ..avgDuration = json['avgDuration'] as String;
}

Map<String, dynamic> _$ChargeReportDataToJson(ChargeReportData instance) =>
    <String, dynamic>{
      'totalDuration': instance.totalDuration,
      'totalSOC': instance.totalSOC,
      'totalCount': instance.totalCount,
      'baseY': instance.baseY,
      'positionY': instance.positionY,
      'record': instance.record,
      'avgSOC': instance.avgSOC,
      'avgDuration': instance.avgDuration
    };
