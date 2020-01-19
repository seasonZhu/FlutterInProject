import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwitchAndCheckBoxView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwitchAndCheckBoxView();
}

class _SwitchAndCheckBoxView extends State<SwitchAndCheckBoxView> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  String _inputString = "";

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CupertinoSwitch(value: _switchSelected, onChanged: (value) {
        setState(() {
          _switchSelected = value;
        });
      },),
      // Checkbox(value: _checkboxSelected, activeColor: Colors.red, onChanged: (value) {
      //   setState(() {
      //     _checkboxSelected = value;
      //   });
      // },),
      CupertinoTextField(placeholder: "请输入文字",keyboardType:TextInputType.emailAddress, onChanged: (value) {
        _inputString = value;
      },),
      SizedBox(
        height: 100,
        width: 100,
        child: CupertinoActivityIndicator(animating: false, radius: 10,),
      ),
    ],
    );
  }
}