import 'package:flutter/material.dart';
import 'package:netigma_web/main_drawer.dart';

import 'localisable_mixin.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with  NetigmaBaseMixin<FormPage>  {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget body() {
    // TODO: implement body
    return Container(child: Center(child: Text("Form page"),),);
  }
}
