import 'package:flutter/material.dart';

import 'package:my_flutter/CupertinoStoreApp/styles.dart';

class DemoWidget extends StatelessWidget {

  final String text;

  DemoWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Color(0xFF8E8E93),
          child: Center(
            child: Text(
              text ?? "hello world",
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ),
        Container(
          width: 400,
          height: 120,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Styles.searchCursorColor,
            border: Border.all(width: 1, color: Color.fromRGBO(180, 12, 128, 1))
          ),
          child: Center(child:
            Text("666666",
              style: Theme.of(context).textTheme.display2,
            ),
          ), 
        ),
      ],
    );
  }
}

/*
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Text("1111"), flex: 2),
            Expanded(child: Text("2222"))
          ],
        ),
 */

class DemoStateWidget extends StatefulWidget {
  final String text;
  ////通过构造方法传值 DemoStateWidget(this.text);
  ///主要是负责创建state
  
  DemoStateWidget({Key key, this.text}) : super(key: key);

  @override
  _DemoStateWidgetState createState() => _DemoStateWidgetState(text);
}

class _DemoStateWidgetState extends State<DemoStateWidget> {
  String text; 
  _DemoStateWidgetState(this.text);

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次 super.initState();
    ///定时1秒
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "这就变了数值";
        }); 
      }
    );
}
  @override
  void dispose() {
  ///销毁
  super.dispose(); 
}
  @override
  void didChangeDependencies() {
  ///在initState之后调 Called when a dependency of this [State] object changes.
  super.didChangeDependencies(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "这就是有状态DMEO"),
    ); 
  }
}