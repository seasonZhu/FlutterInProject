import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:my_flutter/MyApp/SectionList.dart';

class MovieView extends StatefulWidget {
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("找片"),
        ),
        child: GestureDetector(
          child: Center(child: Text("找片")),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MinList(),
              ),
            );
          },
        )
    );
  }
}
