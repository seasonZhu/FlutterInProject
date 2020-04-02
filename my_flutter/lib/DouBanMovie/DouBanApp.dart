import 'package:flutter/material.dart';

import 'MainView.dart';
import 'CityView.dart';

class DouBanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
      routes: {
        '/Citys': (context) => CityView(),
      },
    );
  }
}