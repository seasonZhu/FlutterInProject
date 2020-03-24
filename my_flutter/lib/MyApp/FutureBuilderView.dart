import 'dart:async';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:my_flutter/models/chargeReport.dart';

class FutureBuilderView extends StatefulWidget {
  @override
  _FutureBuilderViewState createState() => _FutureBuilderViewState();
}

class _FutureBuilderViewState extends State<FutureBuilderView> {
  Dio _dio = Dio();

  final String chargeReportApi =
      "https://www.fastmock.site/mock/495b71fd9424c34326056713d9d3fb64/core/chargingReports/20355133";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("网络请求的List"),
        ),
        body: getContainer(),
      );
  }

  Container getContainer() {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
          future: getChargeReport(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            //请求完成
            if (snapshot.connectionState == ConnectionState.done) {
              ChargeReport model = snapshot.data;
              //发生错误
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //请求成功，通过项目信息构建用于显示项目名称的ListView
              //return getSectionIndexListView(model);
              return getSectionHeaderListView(model);
              return getAnotherListView(model);
              return ListView.builder(
                itemCount: model.data.record.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(model.data.record[index].startDay);
                },
              );
            }
            //请求未完成时弹出loading
            return CircularProgressIndicator();
          }),
    );
  }

  ListView getAnotherListView(ChargeReport model) {
    return ListView(
      children: model.data.record
          .map<Widget>((r) => ListTile(title: Text(r.startDay + r.hashCode.toString())))
          .toList(),
    );
  }

  Widget getSectionHeaderListView(ChargeReport model) {
    return Column(children: 
      <Widget>[
        ListTile(title: Text("车辆保养记录")),
        Expanded(
          child: getAnotherListView(model),
        ),
      ]
    );
  }

  Widget getSectionIndexListView(ChargeReport model) {
    return Flex(direction: Axis.vertical, children: <Widget>[
      ListView(
      children: model.data.record
          .map<Widget>((r) => getSectionHeaderListView(model))
          .toList(),
    ),
    ],);
  }

  Future<ChargeReport> getChargeReport() async {
    Response response = await _dio.get(chargeReportApi);
    //data类型是Map<String, dynamic>
    return ChargeReport.fromJson(response.data);
  }
}

class FutureBuilderMockView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilderVire"),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return Text("Error: ${snapshot.error}");
              } else {
                // 请求成功，显示数据
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }
}
