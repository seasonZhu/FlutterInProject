import 'package:flutter/material.dart';

import 'RegionVo.dart';

class RegionList extends StatefulWidget {
  final List<RegionVo> items;
  final IndexedWidgetBuilder headerBuild;
  final IndexedWidgetBuilder sectionBuild;
  final IndexedWidgetBuilder itemsBuild;

  RegionList({
    Key key,
    @required this.items,
    this.headerBuild,
    @required  this.sectionBuild,
    @required  this.itemsBuild
  }) : super(key: key);

  @override
  RegionListState createState() => new RegionListState();
}

class RegionListState extends State<RegionList> implements SectionInderxer {
  Color _pressColor = Colors.transparent;
  final ScrollController _scrollController = new ScrollController();

  bool _onNotification(ScrollNotification notification) {
    return true;
  }

  _isShowHeader(index) {
    if (index == 0 && widget.headerBuild != null) {
      return Offstage(
        offstage: false,
        child: widget.headerBuild(context, index),
      );
    }
    return Container();
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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: _onNotification,
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      _isShowHeader(index),
                      Offstage(
                          //当offstage为false时 显示
                          offstage: _shouldShowSectionHeader(index),
                          child: widget.sectionBuild(context, index)),
                      Column(
                        children: <Widget>[
                          widget.itemsBuild(context, index),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          //排序字母
          Positioned(
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
          )
        ],
      ),
    );
  }

  listScrollTopPosition(int index) {
    for (var i = 0; i < widget.items.length; i++) {
      if (siderBarKey[index] == "*" || siderBarKey[index] == "^") {
        _scrollController.jumpTo(0.0);
        setState(() {});
        return -1;
      } else if (widget.items[i].sectionKey == siderBarKey[index]) {
        return i;
      }
    }
    return -1;
  }
}

abstract class SectionInderxer {
  listScrollTopPosition(int index);
}

const siderBarKey = <String>[
  "*",
  "^",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "Z",
];