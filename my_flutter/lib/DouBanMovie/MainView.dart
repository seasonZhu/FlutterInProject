import 'package:flutter/material.dart';

import 'HotView.dart';
import 'MovieView.dart';
import 'MineView.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final _views = [HotView(), MovieView(), MineView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_views[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel), 
            title: Text('热映')),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), 
            title: Text('找片')),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), 
            title: Text('我的')
          )
        ], //BottomNavigationBarItem 的 icon 用的是 Icon Widget实现的，这里是随便找的图标，先实现功能，后续在改成和 豆瓣电影 的一样
        currentIndex: _selectedIndex, //默认选中的 index
        fixedColor: Colors.black, //选中时颜色变为黑色
        type: BottomNavigationBarType.fixed, //类型为 fixed
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //刷新界面
    });
  }
}
