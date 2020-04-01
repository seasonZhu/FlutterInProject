import 'package:flutter/foundation.dart';

class RegionVo {
  String sectionKey;
  String name;

  RegionVo({@required this.sectionKey,this.name});
}

List<RegionVo> regionDataSource = [
  new RegionVo(
      sectionKey: 'A',
      name: '阿拉善',
    ),
  new RegionVo(
      sectionKey: 'A',
      name: '安庆市',
    ),
  new RegionVo(
      sectionKey: 'A',
      name: '安阳市',
    ),
  new RegionVo(
      sectionKey: 'B',
      name: '北京',
    ),  
  new RegionVo(
      sectionKey: 'B',
      name: '包头市',
    ),
  new RegionVo(
      sectionKey: 'C',
      name: '承德市',
    ),
    new RegionVo(
      sectionKey: 'C',
      name: '沧州市',
    ),
  new RegionVo(
      sectionKey: 'C',
      name: '池州',
    ),
    new RegionVo(
      sectionKey: 'C',
      name: '长阳',
    ),
  new RegionVo(
      sectionKey: 'D',
      name: '德州',
    ),
    new RegionVo(
      sectionKey: 'D',
      name: '达州',
    ),
  new RegionVo(
      sectionKey: 'D',
      name: '定西市',
    ),
];