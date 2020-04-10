import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

import 'package:my_flutter/DouBanMovie/DouBanApp.dart';
import 'package:my_flutter/MyApp/MyApp.dart';
import 'package:my_flutter/CupertinoStoreApp/app.dart';

//void main() => runApp(DouBanApp());

const String _kReloadChannelName = 'reload';
const BasicMessageChannel<String> _kReloadChannel =
    BasicMessageChannel<String>(_kReloadChannelName, StringCodec());

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Start listening immediately for messages from the iOS side. ObjC calls
  // will be made to let us know when we should be changing the app state.
  _kReloadChannel.setMessageHandler(run);
  // Start off with whatever the initial route is supposed to be.
  run(ui.window.defaultRouteName);
}

Future<String> run(String name) async {
  // The platform-specific component will call [setInitialRoute] on the Flutter
  // view (or view controller for iOS) to set [ui.window.defaultRouteName].
  // We then dispatch based on the route names to show different Flutter
  // widgets.
  // Since we don't really care about Flutter-side navigation in this app, we're
  // not using a regular routes map.
  switch (name) {
    case "test":
      runApp(TestApp(
        title: "我是路由测试test",
      ));
      break;
    case "douban":
      runApp(DouBanApp());
      break;
    case "store":
      runApp(cupertinoStoreApp());
      break;
    case "myApp":
      runApp(MyApp());
      break;
    default:
      runApp(MyApp());
      break;
  }
  return '';
}

class TestApp extends StatelessWidget {
  // 方法通道
  static const popMethodChannel = const MethodChannel('flutter.pop');

  static const pushMethodChannel = const MethodChannel('flutter.push');

  TestApp({this.title});

  final String title;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Just Test',
        debugShowCheckedModeBanner: false, // 显示和隐藏
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "$title",
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  print("点击了返回按钮");
                  _flutterCallbackPopMethod();
                  //Navigator.pop(context);
                },
              ),
            ),
            body: GestureDetector(
              child: Center(
                child: Text("Hello,world"),
              ),
              onTap: () {
                print("文字的点击事件");
                _flutterCallbackPushMethod();
              },
            )));
  }

  Future<void> _flutterCallbackPopMethod() async {
    try {
      // 约定好返回参数的类型,便于进行交互
      var _ = await popMethodChannel.invokeMethod('pop', null);
    } on PlatformException catch (e) {
      //抛出异常
      print(e);
    }
  }

  Future<void> _flutterCallbackPushMethod() async {
    try {
      // 约定好返回参数的类型,便于进行交互
      var _ = await pushMethodChannel.invokeMethod('push', null);
    } on PlatformException catch (e) {
      //抛出异常
      print(e);
    }
  }
}
