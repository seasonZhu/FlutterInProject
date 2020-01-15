import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

class NextPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "第二页"
        ),
      ), 
      body: Center(
        child: Text(
          "当前是第二页"
          ),
        ),
    );
  }
}

class CupertinoNextPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Next Page"
        )
      ),
      child: Center(
        child: Text(
          "data"
        ),
      ),
    );
  }
}