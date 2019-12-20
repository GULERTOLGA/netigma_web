import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../statics.dart';
import 'client_uset.dart';

class AuthProvider extends InheritedWidget {
  const AuthProvider({Key key, Widget child, this.auth})
      : super(key: key, child: child);
  final BaseAuth auth;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AuthProvider);
  }
}

abstract class BaseAuth {
  Future<ClientUser> signInWithEmailAndPassword(String email, String password,
      Function onTimeOut, Function onSocketException, Function onServerError);
  ClientUser getCurrentUser();
  void refreshSession(ClientUser user);
  Future<bool> isLogin(String sessionID);
  int testInt;
}

class Auth implements BaseAuth {
  ClientUser currentUser;
  ClientUser retVal;

  Future<ClientUser> signInWithEmailAndPassword(
      String email,
      String password,
      Function onTimeOut,
      Function onSocketException,
      Function onServerError) async {
    ClientUser user = new ClientUser(
      userName: email,
      password: password,
      sessionid: "",
    );

    print("signInWithEmailAndPassword start");
    print(ApplicationSettings.endPoint);

    try {
      final response = await http
          .post("${ApplicationSettings.endPoint}/Authentication/Login",
              body: user.toJsonMap())
          .timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        retVal = ClientUser.fromJson(json.decode(response.body));
        currentUser = retVal;
      } else {
        onServerError();
      }
    } on TimeoutException catch (_) {
      onTimeOut();
    } on SocketException catch (_) {
      onSocketException();
    }
    return retVal;
  }



  @override
  void refreshSession(ClientUser user) async {
    final response = await http
        .get(
            "${ApplicationSettings.endPoint}/Authentication/Refresh?SessionID=${ApplicationSettings.sessionID}")
        .timeout(Duration(seconds: 30));
  }

  @override
  ClientUser getCurrentUser() {
    return currentUser;
  }

  @override
  Future<bool> isLogin(String sessionID) async {
    final response = await http
        .get(
            "${ApplicationSettings.endPoint}/Authentication/IsLogined?SessionID=$sessionID")
        .timeout(Duration(seconds: 30));
    var retVl = json.decode(response.body);
    return retVl;
  }

  @override
  int testInt = 0;
}
