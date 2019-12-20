import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netigma_web/Pages/login_page.dart';
import 'package:netigma_web/authentication/auth.dart';

import '../main_drawer.dart';
import '../statics.dart';

mixin NetigmaBaseMixin<T extends StatefulWidget> on State<T> {
  Widget body();

  bool _isLogin = false;

  String getTitle();

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    _isLogin = ApplicationSettings.sessionID != null && ApplicationSettings.sessionID.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    ApplicationSettings.endPoint = "http://ssltest.netcad.com.tr/wn/gisapi/";

    return !_isLogin
        ?  AuthProvider(child: LoginPage(onLogin: (sessionID){
          setState(() {
            _isLogin = true;
          });
    },))
        : Scaffold(
            drawer: MainDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(getTitle()),
            ),
            body: body(),
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
