import 'package:flutter/material.dart';

import 'HotMovieData.dart';
import 'package:my_flutter/models/doubanSubject.dart';
import 'package:my_flutter/models/doubanPersonInfo.dart';

class HotMovieCell extends StatefulWidget {
  final DoubanSubject subject;

  HotMovieCell(this.subject);

  @override
  _HotMovieCellState createState() => _HotMovieCellState();
}

class _HotMovieCellState extends State<HotMovieCell> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true; //返回 true，表示不会被回收

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            widget.subject.images.small,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.subject.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "评分: " + widget.subject.rating.average.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text('导演: ' + widget.subject.directors[0].name,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Text('主演: ' + getCasts(widget.subject.casts),
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.subject.collect_count.toString()+'人看过',style: TextStyle(color: Colors.red,fontSize: 14),),
                OutlineButton(
                  child: Text('购票',style: TextStyle(fontSize: 16),),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red
                  ),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String getCasts(List<DoubanPersonInfo> casts) {
    return casts.map((info) => info.name).join("/");
  }
}