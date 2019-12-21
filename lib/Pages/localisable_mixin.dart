import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netigma_web/Pages/chart_page2.dart';
import 'package:netigma_web/Pages/login_page.dart';
import 'package:netigma_web/Pages/query_page.dart';
import 'package:netigma_web/authentication/auth.dart';

import '../main_drawer.dart';
import '../statics.dart';
import 'chart_page.dart';
import 'form_page.dart';

mixin NetigmaBaseMixin<T extends StatefulWidget> on State<T> {
  Widget body();

  bool _isLogin = false;

  String getTitle();

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    _isLogin =
        true; // ApplicationSettings.sessionID != null && ApplicationSettings.sessionID.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ApplicationSettings.endPoint = "http://ssltest.netcad.com.tr/wn/gisapi/";
    var bWidth = 250.0;
    var size = MediaQuery.of(context).size;
    return !_isLogin
        ? AuthProvider(child: LoginPage(
            onLogin: (sessionID) {
              setState(() {
                _isLogin = true;
              });
            },
          ))
        : Scaffold(
            drawer: MainDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(getTitle()),
            ),
            body: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: bWidth,
                    height: size.height,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(0.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFEBEBEB),
                          offset: Offset(3.0, 3.0),
                          blurRadius: 1.3,
                        ),
                      ],
                    ),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.dashboard),
                          title: Text('Targets By Year KPI'),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              new CupertinoPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => ChrPage(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.people),
                          title: Text('My Targets'),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              new CupertinoPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => ChrPage2(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.people_outline),
                          title: Text('Departments KPI'),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              new CupertinoPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => ChrPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(16),
                      width: size.width - bWidth,
                      child: body())
                ]),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Navigator.of(context).canPop()
                ? FloatingActionButton(
                    onPressed: () {
                      if (Navigator.of(context).canPop())
                        Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios),
                  )
                : null,
          );
  }
}
