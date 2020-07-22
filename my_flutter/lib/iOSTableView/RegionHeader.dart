import 'package:flutter/material.dart';

class RegionHeader extends StatefulWidget {
  final String title;
  RegionHeader({Key key, @required this.title});

  @override
  _RegionHeaderState createState() => _RegionHeaderState();
}

class _RegionHeaderState extends State<RegionHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey[100]))),
        height: 64.0,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Image.asset(
                  'images/avatar.jpg',
                  width: 32,
                  height: 32,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.title),
                ],
              )),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("tableView的HeaderView"),
                ],
              )),
            ],
          ),
        ));
  }
}
