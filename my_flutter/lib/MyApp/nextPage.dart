import 'package:flutter/material.dart';

import 'package:my_flutter/Study/DemoWidget.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Next Page"),
        ),
        body: Column(
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
        ));
  }
}
