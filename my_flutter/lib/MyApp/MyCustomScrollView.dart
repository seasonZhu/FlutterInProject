import 'package:flutter/material.dart';

/* 
  iOS中的tableView sectionHeader是不是很难实现
 */
class MyCustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 可滚动Widget '),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              leading: null,
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('1st Grid View'),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
            const SliverAppBar(
              pinned: true,
              expandedHeight: 44,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Unlimited List View'),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }

  void goback({BuildContext context}) {
    Navigator.pop(context);
  }

  Widget back({BuildContext context}) {
    return GestureDetector(
      child: Icon(Icons.arrow_back, color: Colors.white),
      onTap: () => Navigator.pop(context),
    );
  }
}
