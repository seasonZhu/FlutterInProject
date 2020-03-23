import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record {
    Record();

    String eachSOC;
    String startSOC;
    String endSOC;
    String startDay;
    String startTime;
    String endTime;
    String duration;
    
    factory Record.fromJson(Map<String,dynamic> json) => _$RecordFromJson(json);
    Map<String, dynamic> toJson() => _$RecordToJson(this);
}
