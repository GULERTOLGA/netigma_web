import 'package:flutter/material.dart';
import 'package:netigma_web/main_drawer.dart';

import 'localisable_mixin.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with NetigmaBaseMixin<FormPage> {

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

    return "FLUTTER Form Page";
  }

}
