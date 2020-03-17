import 'package:flutter/material.dart';

import 'FutureBuilderView.dart';
import 'GradientButton.dart';

class ProgressView extends StatefulWidget {
  @override
  _ProgressViewState createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  DateTime _lastPressedAt; //上次点击时间

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProgressView"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                    .animate(_animationController), // 从灰色变成蓝色
                value: _animationController.value,
              ),
            ),
            WillPopScope(
                onWillPop: () async {
                  if (_lastPressedAt == null ||
                      DateTime.now().difference(_lastPressedAt) >
                          Duration(seconds: 1)) {
                    //两次点击间隔超过1秒则重新计时
                    _lastPressedAt = DateTime.now();
                    return false;
                  }
                  return true;
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("1秒内连续按两次返回键退出"),
                )),
            FlatButton(
              child: Text("FutureBuilderView"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //fullscreenDialog: true, //加上这句是present, 不加这句是push
                    builder: (context) => FutureBuilderView(),
                  ),
                );
              },
            ),
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("Submit"),
              onPressed: onTap,
            ),
          ],
        ),
      ),
    );
  }

  void onTap() {
    print("GradientButton press action");
  }
}
