import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'HotMovieData.dart';
import 'HotMovieCell.dart';
import 'package:my_flutter/models/doubanData.dart';

class HotMoviesListView extends StatefulWidget {
  @override
  _HotMoviesListViewState createState() => _HotMoviesListViewState();
}

class _HotMoviesListViewState extends State<HotMoviesListView> {
  List<HotMovieData> hotMovies = new List<HotMovieData>();

  Dio _dio = Dio();

  final String douBanDataApi =
      "https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=%E6%B7%B1%E5%9C%B3&start=0&count=10";

  @override
  void initState() {
    super.initState();

    var data = HotMovieData('反贪风暴4', 6.3, '林德禄', '古天乐/郑嘉颖/林峯', 29013,
        'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2551353482.webp');
    setState(() {
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
      hotMovies.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
          future: getDoubanData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              DoubanData model = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              return getMovieListView(context, model);
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }),
    );
  }

  Widget getMovieListView(BuildContext context, DoubanData model) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: model.subjects.length,
        itemBuilder: (context, index) {
          return HotMovieCell(model.subjects[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      ),
    );
  }

  Future<DoubanData> getDoubanData() async {
    Response response = await _dio.get(douBanDataApi);
    //data类型是Map<String, dynamic>
    return DoubanData.fromJson(response.data);
  }
}
