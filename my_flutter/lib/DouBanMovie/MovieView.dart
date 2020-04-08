import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(navigationBar: CupertinoNavigationBar(middle: Text("照片"),), child: Center(child: Text("找片")));
  }
}