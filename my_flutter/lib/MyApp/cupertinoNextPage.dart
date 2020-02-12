import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controlView.dart';

class CupertinoNextPage extends StatefulWidget {
  @override
  _CupertinoNextPageState createState() => _CupertinoNextPageState();
}

class _CupertinoNextPageState extends State<CupertinoNextPage> {
  var _switchSelected = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Next Page")),
      child: Center(
        child: CupertinoButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  fullscreenDialog: !_switchSelected, //加上这句是present, 不加这句是push
                  builder: (context) => ControlView(),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("cupertino Next Page"),
                CupertinoSwitch(
                  value: _switchSelected,
                  onChanged: (value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
              ],
            )),
      ),
    );
  }
}
