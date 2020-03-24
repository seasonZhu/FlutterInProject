import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ControlView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ControlViewState();
}

class _ControlViewState extends State<ControlView> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  String _inputString = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("ControlView"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CupertinoSwitch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          // 下面的代码直接跑着直接就跪了
          Material(
            child: Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            ),
          ),
          RaisedButton(
            onPressed: () {
              print("点击了按钮");
            },
            child: Text("Material Button"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CupertinoTextField(
              placeholder: "请输入文字",
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                _inputString = value;
                print(_inputString);
              },
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: CupertinoActivityIndicator(
              animating: false,
              radius: 10,
            ),
          ),
        ],
      ),
    );
  }
}
