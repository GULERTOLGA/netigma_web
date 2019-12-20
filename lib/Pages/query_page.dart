import 'package:flutter/material.dart';

import '../main_drawer.dart';
import 'localisable_mixin.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> with SingleTickerProviderStateMixin, NetigmaBaseMixin<QueryPage> {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        ],
      ),
    );

  }

  @override
  String getTitle() {

    return "NE T I G M A Query Page";
  }

}
