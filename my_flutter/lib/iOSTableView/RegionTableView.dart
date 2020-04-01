import 'package:flutter/material.dart';

import 'Regions.dart';

class RegionTableView extends StatefulWidget {
  @override
  _RegionTableViewtate createState() => _RegionTableViewtate();
}

class _RegionTableViewtate extends State<RegionTableView> {
  _cusAppBar() {
    return AppBar(
      title: Text('定位'),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'search');
          },
          child: Icon(
            Icons.search,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: GestureDetector(
            onTap: () async {
              showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(500.0, 86.0, 25.0, 0.0),
                items: <PopupMenuEntry>[
                  new PopupMenuItem<String>(
                      value: 'value01', child: new Text('Item One')),
                  new PopupMenuDivider(height: 1.0),
                  new PopupMenuItem<String>(
                      value: 'value02', child: new Text('Item Two')),
                  new PopupMenuDivider(height: 1.0),
                  new PopupMenuItem<String>(
                      value: 'value03', child: new Text('Item Three')),
                  new PopupMenuDivider(height: 1.0),
                  new PopupMenuItem<String>(
                      value: 'value04', child: new Text('I am Item Four'))
                ],
              );
            },
            child: Icon(Icons.add_circle),
          ),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue, Colors.blueAccent],
          ),
        ),
      ),
    );
  }

  Regions region = new Regions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cusAppBar(),
      body: region,
    );
  }
}