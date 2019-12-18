import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netigma_web/form_page.dart';
import 'package:netigma_web/query_page.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header', style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
              ),
            ),
            Hero(
              tag: "aaa",
              child: ListTile(
                title: Text('Query Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new CupertinoPageRoute<bool>(

                      builder: (BuildContext context) => QueryPage(),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Form Page'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new CupertinoPageRoute<bool>(

                    builder: (BuildContext context) => FormPage(),
                  ),
                );
              },
            ),
          ],
        ),
      );

  }
}