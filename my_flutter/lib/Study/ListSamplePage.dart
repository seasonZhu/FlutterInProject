import 'package:flutter/material.dart';

// 格式化当前窗口中代码的方法是先在代码窗口中单击右键，然后选择 Format Document 选项即可。
// 也可以在 VS Code 的偏好设置里面增加快捷键，然后使用快捷键操作。

class ListSamplePage extends StatefulWidget {
  ListSamplePage({Key key}) : super(key: key);

  @override
  _ListSamplePageState createState() => _ListSamplePageState();
}

class _ListSamplePageState extends State<ListSamplePage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    //return getScaffold();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widgets.add(getRow(widgets.length + 1));
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        setState(() {
          widgets.add(getRow(widgets.length + 1));
          print('row $i');
        });
      },
    );
  }

  Widget getScaffold() {
     return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: getListenListView(),
    );
  }
/* 这个例子是用来展示监听的 */
  Widget getListenListView() {
    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollStartNotification:
            print("开始滚动");
            break;
          case ScrollUpdateNotification:
            print("正在滚动");
            break;
          case ScrollEndNotification:
            print("滚动停止");
            break;
          case OverscrollNotification:
            print("滚动到边界");
            break;
        }
      },
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          }),
    );
  }
}
