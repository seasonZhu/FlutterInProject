import 'package:flutter/material.dart';

import 'RegionVo.dart';
import 'RegionList.dart';
import 'RegionItem.dart';
import 'RegionHeader.dart';

class Regions extends StatefulWidget {
  @override
  RegionState createState() => new RegionState();
}

class RegionState extends State<Regions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegionList(
        items: regionDataSource,
        headerBuild: (BuildContext context, int index) {
          return Container(
            child: RegionHeader(
              title: '宁波',
            ),
          );
        },
        itemsBuild: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: RegionItem(item: regionDataSource[index]),
          );
        },
        sectionBuild: (BuildContext context, int index){
          return Container(
            height: 22.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[100],
            alignment: Alignment.centerLeft,
            child: Text(
              regionDataSource[index].sectionKey,
              style: TextStyle(fontSize: 12.0,color: Colors.black87),
            ),
          );
        },
      ),
    );
  }
}