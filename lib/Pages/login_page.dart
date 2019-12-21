import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:netigma_web/authentication/auth.dart';
import 'package:netigma_web/authentication/client_uset.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../statics.dart';

typedef SuccessfulLogin<T> = void Function(T value);

class LoginPage extends StatefulWidget {
  final SuccessfulLogin onLogin;

  const LoginPage({Key key, @required this.onLogin}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String _userName;
  String _password;
  ClientUser _user;
  bool _rememberMeChecked = false;
  bool _loginProcess = false;
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

      print("${ApplicationSettings.endPoint}/Authentication/Login");
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


  Future<void> validateAndSubmit(context) async {
    if (!_loginProcess) {
      setState(() {
        _loginProcess = true;
      });

      String errorMessage;

      final BaseAuth auth = AuthProvider.of(context).auth;
      print("login_screen :: validateAndSubmit :: login start...");

      print(auth);

      final ClientUser user = await signInWithEmailAndPassword(
          userNameController.text, passwordController.text, () {
        errorMessage ="Time out";
      }, () {
        print("login_screen :: validateAndSubmit :: login socket exception...");
        errorMessage = "Socket Exception";
      }, () {
        errorMessage ="Server error";
        print("server error");
      });

      print("login_screen :: validateAndSubmit :: Login end");
      if (errorMessage == null) {
        if (user != null && user.sessionid.isNotEmpty) {
          print("login_screen :: validateAndSubmit :: Logged in ");
          _user = user;
          _userName = user.userName;

        

          ApplicationSettings.sessionID = user != null ? user.sessionid : "";
          if(widget.onLogin != null)
            widget.onLogin( ApplicationSettings.sessionID );


        } else {
          _showDialog("Wrong user name or password");
          
          setState(() {
            _loginProcess = false;
          });
        }
      } else {
        setState(() {
          _loginProcess = false;
        });
        _showDialog(errorMessage);
        
      }
    }
  }



  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("!"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "OK"
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder enabledBorder = new OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(16.0),
        ),
        borderSide: new BorderSide(
            color: Colors.grey, style: BorderStyle.solid, width: 1.0));

    var textboxPadding = EdgeInsets.fromLTRB(5.0, 16.0, 25.0, 16.0);

    TextStyle buttonTextStyle = TextStyle(
        fontFamily: 'Montserrat', color: Colors.white, fontSize: 15.0);

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "TEST NETIGMA WEB SITE",
              style: (TextStyle(
                  fontSize: 30,
                  fontFamily: "Hind",
                  color: Theme.of(context).accentColor)),
            ),
          ),
          Center(
              child: Container(
            width: 400,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      controller: userNameController,                     
                      decoration: InputDecoration(
                        enabledBorder: enabledBorder,
                        contentPadding: textboxPadding,
                        focusedBorder: enabledBorder,
                        hintText: "User Name",
                        labelText: "User Name",
                        hintStyle: TextStyle(color: Colors.white24),
                        prefixIcon: Hero(
                            tag: "selectcompany",
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).backgroundColor,
                            )),
                      ),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,                 
                      decoration: InputDecoration(
                        enabledBorder: enabledBorder,
                        contentPadding: textboxPadding,
                        focusedBorder: enabledBorder,
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white24),
                        helperText: "Enter your netcad account informations.",
                        labelText: "Password",
                        prefixIcon: Hero(
                            tag: "selectcompany222",
                            child: Icon(
                              Icons.lock,
                              color: Theme.of(context).backgroundColor,
                            )),
                      ),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: MaterialButton(

                        onPressed: () {
                          validateAndSubmit(context);

                        },
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Theme.of(context).primaryColorDark,
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).primaryColorLight,
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.0))),
                          child: !_loginProcess
                              ? Text("Login",
                                  textAlign: TextAlign.center,
                                  style: buttonTextStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        height: 15,
                                        width: 15,
                                        margin: EdgeInsets.all(1),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.0,
                                          valueColor:
                                              new AlwaysStoppedAnimation(
                                                  Theme.of(context)
                                                      .primaryColorDark),
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )),
                ],
              ),
            ),
          )),
          Align(alignment: Alignment.bottomCenter, child: Image.asset("city-bg.png"),)
        ],
      ),
    ));
  }
}
