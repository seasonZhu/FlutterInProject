import 'package:flutter/foundation.dart';

class RegionVo {
  String sectionKey;
  String name;

  RegionVo({@required this.sectionKey,this.name});
}

List<RegionVo> regionDataSource = [
  RegionVo(
      sectionKey: 'A',
      name: '阿拉善',
    ),
  RegionVo(
      sectionKey: 'A',
      name: '安庆市',
    ),
  RegionVo(
      sectionKey: 'A',
      name: '安阳市',
    ),
  RegionVo(
      sectionKey: 'B',
      name: '北京',
    ),  
  RegionVo(
      sectionKey: 'B',
      name: '包头市',
    ),
  RegionVo(
      sectionKey: 'C',
      name: '承德市',
    ),
    RegionVo(
      sectionKey: 'C',
      name: '沧州市',
    ),
  RegionVo(
      sectionKey: 'C',
      name: '池州',
    ),
    RegionVo(
      sectionKey: 'C',
      name: '长阳',
    ),
  RegionVo(
      sectionKey: 'D',
      name: '德州',
    ),
    RegionVo(
      sectionKey: 'D',
      name: '达州',
    ),
  RegionVo(
      sectionKey: 'D',
      name: '定西市',
    ),
];