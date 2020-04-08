import 'package:flutter/material.dart';
import 'dart:async';

class MineView extends StatefulWidget {
  static final number = 10;

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView>
    with AutomaticKeepAliveClientMixin {
  int _count = 0;
  // 这个例子中使用的static final 结果切换到别的tab就直接跪了,还是在初始化的时候申明比较好
  StreamController<int> _controller;

  Sink<int> _sink;

  Stream<int> _stream;

  @override
  //@mustCallSuper
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>();
    _sink = _controller.sink;
    _stream = _controller.stream;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("使用Dart自带的StreamController"),
      ),
      body: StreamBuilder(
          initialData: 0,
          stream: _stream,
          builder: (context, snapShot) {
            return Center(
              child: Text(
                '${snapShot.data}',
                style: TextStyle(fontSize: 30),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    _sink.add(++_count);
  }

  @override
  void dispose() {
    super.dispose();
    _sink.close();
    _controller.close();
  }
}
