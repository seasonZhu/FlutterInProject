import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:my_flutter/CupertinoStoreApp/app.dart';

import 'NextPageView.dart';
import 'CupertinoNextPageView.dart';
import 'GestureDetectorTestRoute.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  static const platform = const MethodChannel('dev.flutter.example/counter');

  String buttonTitle = 'You have pushed the button this many times:';

  // 一个单纯的flutter中的按钮点击事件
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //fullscreenDialog: true, //加上这句是present, 不加这句是push
                  builder: (context) => materialNextPageView(),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonTitle,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Divider(height: 1,),
            RaisedButton(
              child: Text("Go to CupertinoStoreApp"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //fullscreenDialog: true, //加上这句是present, 不加这句是push
                    builder: (context) => storeApp(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go to CupertinoNextPageView"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //fullscreenDialog: true, 加上这句是present, 不加这句是push
                    builder: (context) => materialOfCupertinoNextPageView(),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Go to GesturedetectorPage"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //fullscreenDialog: true, 加上这句是present, 不加这句是push
                    builder: (context) => gesturedetectorPage(),
                  ),
                );
              },
            ),
            Divider(height: 1,),
            FlatButton(
              child: Text("Date Pike"),
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2100, 12, 31), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.zh);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 将一个cupertino组件封装到material框架中
  Widget materialOfCupertinoNextPageView() {
    //return CupertinoNextPageView();
    return Material(
      child: CupertinoNextPageView(),
    );
  }

  Widget gesturedetectorPage() {
    return Material(
      child: GestureDetectorTestRoute(),
    );
  }

  // 纯material组件
  Widget materialNextPageView() {
    return NextPageView();
  }

  Widget storeApp() {
    return cupertinoStoreApp();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  // 可以进行将flutter中的值传递给原生界面的操作
  Future<void> incrementCounter() async {
    print("点击了加好按钮");
    setState(() {
      _counter++;
    });

    try {
      final int result = await platform.invokeMethod('incrementCounter');
      print(result);
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
