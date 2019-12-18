import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_drawer.dart';

 mixin NetigmaBaseMixin<T extends StatefulWidget> on State<T> {

   Widget body();

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       drawer: MainDrawer(),
       appBar: AppBar(
         title: Text("NETIGMA Fusuion"),
       ),
       body: body(),
// This trailing comma makes auto-formatting nicer for build methods.
     );
   }
   

}


