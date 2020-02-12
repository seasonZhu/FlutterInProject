import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controlView.dart';

class CupertinoNextPage extends StatelessWidget {
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
                //fullscreenDialog: true, //加上这句是present, 不加这句是push
                builder: (context) => ControlView(),
              ),
            );
          },
          child: Text("cupertino Next Page"),
        ),
      ),
    );
  }
}
