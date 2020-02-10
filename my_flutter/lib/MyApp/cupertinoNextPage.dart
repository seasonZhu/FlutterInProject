import 'package:flutter/cupertino.dart';

class CupertinoNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "Next Page"
        )
      ),
      child: Center(
        child: Text(
          "cupertino Next Page"
        ),
      ),
    );
  }
}