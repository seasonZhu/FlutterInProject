import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//import 'model/app_state_model.dart';

class ProductListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Cupertino Store'),
        ),
      ],
    );
  }
}