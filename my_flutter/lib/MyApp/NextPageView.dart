import 'package:flutter/material.dart';

import 'DemoWidget.dart';
import 'ProgressView.dart';

class NextPageView extends StatefulWidget {
  @override
  _NextPageViewState createState() => _NextPageViewState();
}

class _NextPageViewState extends State<NextPageView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List tabs = ["新闻", "历史", "图片"];

  int _selectedIndex = 0;

  int _sum = 0;

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 自定义左侧按钮
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              print("返回按钮?");
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.system_update, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //fullscreenDialog: true, //加上这句是present, 不加这句是push
                  builder: (context) => ProgressView(),
                ),
              );
            },
          )
        ],
        title: Text("Next Page"),
        centerTitle: false,
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      drawer: Drawer(),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            //创建3个Tab页
            return Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(e, textScaleFactor: 5),
                    Text(_sum.toString(), textScaleFactor: 5),
                    getColumn(),
                  ],
                ));
          }).toList()),
      bottomNavigationBar:
          _sum % 5 == 0 ? getBottomNavigationBar() : getBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: _sum % 5 == 0
          ? FloatingActionButtonLocation.endDocked
          : FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar getBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          SizedBox(), //中间位置空出
          IconButton(
            icon: Icon(Icons.business),
            onPressed: () {},
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      ),
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return BottomNavigationBar(
      // 底部导航
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text('Business')),
        BottomNavigationBarItem(
            icon: Icon(Icons.school), title: Text('School')),
      ],
      currentIndex: _selectedIndex,
      fixedColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  void _onAdd() {
    setState(() {
      _sum += 1;
    });
  }

  Column getColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text("material Next Page"),
        ),
        Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //fullscreenDialog: true, //加上这句是present, 不加这句是push
                  builder: (context) => DemoWidget(),
                ),
              );
            },
            child: Text("Go to DemoWidget"),
          ),
        )
      ],
    );
  }
}
