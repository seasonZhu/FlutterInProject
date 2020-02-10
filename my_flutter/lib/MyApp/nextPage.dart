import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
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
          "material当前是第二页"
          ),
        ),
    );
  }
}