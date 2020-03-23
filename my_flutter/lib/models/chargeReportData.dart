import 'package:json_annotation/json_annotation.dart';
import "record.dart";
part 'chargeReportData.g.dart';

@JsonSerializable()
class ChargeReportData {
    ChargeReportData();

    String totalDuration;
    String totalSOC;
    String totalCount;
    String baseY;
    String positionY;
    List<Record> record;
    String avgSOC;
    String avgDuration;
    
    factory ChargeReportData.fromJson(Map<String,dynamic> json) => _$ChargeReportDataFromJson(json);
    Map<String, dynamic> toJson() => _$ChargeReportDataToJson(this);
}
