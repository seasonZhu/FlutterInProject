import 'package:json_annotation/json_annotation.dart';

part 'chargeReport.g.dart';

@JsonSerializable()
class ChargeReport {
    ChargeReport();

    String code;
    String msg;
    Map<String,dynamic> data;
    
    factory ChargeReport.fromJson(Map<String,dynamic> json) => _$ChargeReportFromJson(json);
    Map<String, dynamic> toJson() => _$ChargeReportToJson(this);
}
