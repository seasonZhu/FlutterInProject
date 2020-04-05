import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'HotMovieData.dart';
import 'package:my_flutter/models/doubanSubject.dart';
import 'package:my_flutter/models/doubanPersonInfo.dart';

class HotMovieCell extends StatefulWidget {
  final DoubanSubject subject;

  HotMovieCell(this.subject);

  @override
  _HotMovieCellState createState() => _HotMovieCellState();
}

class _HotMovieCellState extends State<HotMovieCell>
    with AutomaticKeepAliveClientMixin {
  
  // 方法通道
  static const methodChannel = const MethodChannel('flutter.doubanmovie/buy');

  // 购买按钮的文字
  var _buyButtonTitle = "购票";

  var _buyState = false;

  @override
  //@mustCallSuper
  bool get wantKeepAlive => true; //返回 true，表示不会被回收

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Text(
                  widget.subject.collect_count.toString() + '人看过',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                OutlineButton(
                  child: Text(
                    _buyButtonTitle,
                    style: TextStyle(fontSize: 16),
                  ),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(color: Colors.red),
                  onPressed: () {
                    if (_buyState) return;
                    _flutterCallbackSwiftMethod();
                  },
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

  // 目前这个方法仅在使用大工程FlutterInProject的时候才能正确调用,在my_flutter调用直接就是找不到方法
  Future<void> _flutterCallbackSwiftMethod() async {
    try {
      // 约定好返回参数的类型,便于进行交互
      var result = await methodChannel.invokeMethod(
                        'buyTicket', '购买 ' + widget.subject.title + ' 电影票一张');
      final bool message = result as bool;

      setState(() {
          _buyButtonTitle = message ? "已购" : "买一张嘛";
      });

      setState(() {
        _buyState = message;
      });
    } on PlatformException catch (e) {//抛出异常
      print(e);
    }
  }
}
