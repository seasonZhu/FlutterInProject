// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chargeReport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargeReport _$ChargeReportFromJson(Map<String, dynamic> json) {
  return ChargeReport()
    ..code = json['code'] as String
    ..msg = json['msg'] as String
    ..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ChargeReportToJson(ChargeReport instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };
