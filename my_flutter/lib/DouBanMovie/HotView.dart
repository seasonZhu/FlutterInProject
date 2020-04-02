import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'HotMovieListView.dart';

class HotView extends StatefulWidget {
  @override
  _HotViewState createState() => _HotViewState();
}

class _HotViewState extends State<HotView> {
  var currentCity = '深圳';

  @override
  void initState() {
    super.initState();
    print('HotWidgetState initState');
    initData();
  }

  void initData() async {
    final prefs = await SharedPreferences.getInstance(); //获取 prefs

    String city = prefs.getString('curCity'); //获取 key 为 curCity 的值

    if (city != null && city.isNotEmpty) {
      //如果有值
      setState(() {
        currentCity = city;
      });
    } else {
      //如果没有值，则使用默认值
      setState(() {
        currentCity = '深圳';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentCity != null && currentCity.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      currentCity,
                      style: TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      _pushToCityView();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          hintText: '电影 / 电视剧 / 影人',
                          hintStyle: TextStyle(
                              fontFamily: 'MaterialIcons', fontSize: 16),
                          contentPadding: EdgeInsets.only(top: 4, bottom: 0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          filled: true,
                          fillColor: Colors.black12),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints.expand(height: 50),
                        child: TabBar(
                            unselectedLabelColor: Colors.black12,
                            labelColor: Colors.black87,
                            indicatorColor: Colors.black87,
                            tabs: <Widget>[
                              Tab(text: '正在热映'),
                              Tab(text: '即将上映')
                            ]),
                      ),
                      Expanded(
                        child: Container(
                          child: TabBarView(
                            children: <Widget>[
                              HotMoviesListView(currentCity),
                              Center(
                                child: Text('即将上映'),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  void _pushToCityView() async {
    // push到CityView页面,并且异步等待回调参数,可以理解为等回调
    var selectCity =
        await Navigator.pushNamed(context, '/Citys', arguments: currentCity);
    if (selectCity == null) return;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('curCity', selectCity); //存取数据

    setState(() {
      currentCity = selectCity;
    });
  }
}
