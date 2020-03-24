import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_flutter/MyApp/CupertinoNextPageView.dart';
//import 'package:gallery/l10n/gallery_localizations.dart'; 这个是用来国际化的包,但是现在我不知道如何使用
class CupertinoSwitchView extends StatefulWidget {
  @override
  _CupertinoSwitchViewState createState() => _CupertinoSwitchViewState();
}

class _CupertinoSwitchViewState extends State<CupertinoSwitchView> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Switch"
          ),
        trailing: CupertinoButton(
            child: Icon(
              Icons.navigate_next, 
              color: Colors.white),
            onPressed: () {
              Navigator.push(
                context, 
                CupertinoPageRoute(
                  //fullscreenDialog: true, //加上这句是present, 不加这句是push
                  builder: (context) => CupertinoNextPageView(),
                ),
              );
            },
          ),
      ),
      child: Center(
        child: Semantics(
          container: true,
          label: "哈哈",
          child: CupertinoSwitch(
            value: _switchValue, 
            onChanged: (value) {
              setState(() {
                _switchValue = value;
                print(value);
              });
            },
          ),
        )
      ),
    );
  }
}