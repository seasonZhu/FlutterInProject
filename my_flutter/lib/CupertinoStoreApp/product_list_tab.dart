import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:my_flutter/CupertinoStoreAppModel/app_state_model.dart';
//import 'product_row_item.dart'; 

class ProductListTab extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     child: Consumer<AppStateModel>(
       builder: (context, model, child) {
         final products = model.getProducts();
         return CustomScrollView(
           semanticChildCount: products.length,
           slivers: <Widget>[
             CupertinoSliverNavigationBar(
               largeTitle: Text('Cupertino Store'),
             ),
           ],
         );
       },
     ),
   );
 }
}