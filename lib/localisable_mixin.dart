import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netigma_web/query_page.dart';

import 'form_page.dart';
import 'main_drawer.dart';

mixin NetigmaBaseMixin<T extends StatefulWidget> on State<T> {
  Widget body();

  bool _signedIn = false;

  Widget _signIn()
  {
    return Container(child:Center(child:Text("login...")),);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var sw = 300.0;
    var lw = w - sw;
    var tStyle = TextStyle(color: Colors.white);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        elevation: 3,
        title: Text("NETIGMA Fusuion"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: sw,
              height: h,
              color: Theme.of(context).accentColor,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
              ListTile(
                      title: Text('Query Page', style: tStyle,),
                leading: Icon(Icons.search, color: Colors.white,),
                      onTap: () {
                        Navigator.of(context).push(
                          new CupertinoPageRoute<bool>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) => QueryPage(),
                          ),
                        );
                      },
                    ),

                  ListTile(
                    leading: Icon(Icons.filter_list, color: Colors.white,),
                    title: Text('Form Page', style: tStyle,),
                    onTap: () {
                      Navigator.of(context).push(
                        new CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) => FormPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: lw,
              height: h,
              child: _signedIn ? body()  : _signIn(),
            )
          ],
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
