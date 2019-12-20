import 'package:flutter/material.dart';

import 'localisable_mixin.dart';
import 'main_drawer.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> with SingleTickerProviderStateMixin,  NetigmaBaseMixin<QueryPage> {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget body() {
    // TODO: implement body
    return Container(child: Center(child: Text("query page"),),);
  }
}
