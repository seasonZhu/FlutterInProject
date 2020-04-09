import 'package:flutter/material.dart';

import 'RegionVo.dart';

class RegionItem extends StatelessWidget {
  final RegionVo item;
  final String titleName;

  RegionItem({this.item, this.titleName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9)))),
      height: 52.0,
      child: FlatButton(
        onPressed: () {
          
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 12.0),
              // color: Colors.grey,
              child: Text(
                titleName == null ? item.name ?? '暂时' : titleName,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}