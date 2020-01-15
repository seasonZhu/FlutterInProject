import 'package:flutter/cupertino.dart';
//import 'package:gallery/l10n/gallery_localizations.dart'; 这个是用来国际化的包,但是现在我不知道如何使用

class CupertinoSwitchDemo extends StatefulWidget {
  @override
  _CupertinoSwitchDemoState createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Switch"
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