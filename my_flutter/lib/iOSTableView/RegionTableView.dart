import 'package:flutter/material.dart';

import 'Regions.dart';
import 'RegionList.dart';
import 'RegionVo.dart';
import 'RegionItem.dart';
import 'RegionHeader.dart';

class RegionTableView extends StatefulWidget {
  final items = regionDataSource;

  @override
  _RegionTableViewtate createState() => _RegionTableViewtate();
}

class _RegionTableViewtate extends State<RegionTableView> {
  var _content = "Hello world";

  var _pressColor = Colors.transparent;

  _cusAppBar() {
    return AppBar(
      title: Text('定位'),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            print("搜索的点击事件");
            //Navigator.pushNamed(context, 'search');
          },
          child: Icon(
            Icons.search,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: GestureDetector(
            onTap: () async {
              var value = await showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(500.0, 86.0, 25.0, 0.0),
                items: <PopupMenuEntry>[
                  PopupMenuItem<String>(
                      value: 'value01', child: Text('Item One')),
                  PopupMenuDivider(height: 1.0),
                  PopupMenuItem<String>(
                      value: 'value02', child: Text('Item Two')),
                  PopupMenuDivider(height: 1.0),
                  PopupMenuItem<String>(
                      value: 'value03', child: Text('Item Three')),
                  PopupMenuDivider(height: 1.0),
                  PopupMenuItem<String>(
                      value: 'value04', child: Text('Item Four'))
                ],
              );

              setState(() {
                _content = value ?? "";
                print(_content);
              });
            },
            child: Icon(Icons.add_circle),
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue, Colors.blueAccent],
          ),
        ),
      ),
    );
  }

  Regions region = new Regions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _cusAppBar(), body: mainView(context: context));
  }

  Widget mainView({BuildContext context}) {
    return SafeArea(
      child: Stack(
        children: <Widget>[listView(context), indexView(context)],
      ),
    );
  }

  Widget indexView(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.25,
      right: 0.0,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.5,
        width: 32.0,
        color: _pressColor,
        child: GestureDetector(
          onTapDown: (TapDownDetails t) {
            setState(() {
              _pressColor = Colors.grey;
            });
          },
          onTapUp: (TapUpDetails t) {
            setState(() {
              _pressColor = Colors.transparent;
            });
          },
          onVerticalDragStart: (DragStartDetails details) {
            //开始垂直滑动
            setState(() {
              _pressColor = Colors.grey;
            });
          },
          onVerticalDragEnd: (DragEndDetails details) {
            setState(() {
              _pressColor = Colors.transparent;
            });
          },
          onVerticalDragUpdate: (DragUpdateDetails details) {
            //手指垂直滑动时
            setState(() {});
          },
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: siderBarKey.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                height: 17.0,
                child: Text(siderBarKey[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget listView(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: widget.items.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              showTableViewHeader(index),
              showSectionHeader(index),
              showCell(index),
            ],
          ),
        );
      },
    );
  }

  Widget showTableViewHeader(int index) {
    if (index == 0) {
      return RegionHeader(
        title: _content,
      );
    } else {
      return Container();
    }
  }

  bool _shouldShowSectionHeader(index) {
    if (index < 0) {
      return false;
    }
    if (index == 0) {
      return false;
    }
    if (index != 0 &&
        widget.items[index].sectionKey != widget.items[index - 1].sectionKey) {
      return false;
    }
    return true;
  }

  Widget showSectionHeader(int index) {
    return Offstage(
        //当offstage为false时 显示
        offstage: _shouldShowSectionHeader(index),
        child: Container(
            height: 22.0,
            padding: const EdgeInsets.only(left: 14.0),
            color: Colors.grey[100],
            alignment: Alignment.centerLeft,
            child: Text(
              widget.items[index].sectionKey,
              style: TextStyle(fontSize: 12.0, color: Colors.black87),
            )));
  }

  Widget showCell(int index) {
    return Column(
      children: <Widget>[RegionItem(item: widget.items[index])],
    );
  }
}
