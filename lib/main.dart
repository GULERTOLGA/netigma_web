import 'package:flutter/material.dart';
import 'package:netigma_web/main_drawer.dart';
import 'package:netigma_web/statics.dart';

import 'Pages/localisable_mixin.dart';
import 'authentication/auth.dart';

void main() => runApp(
    MyApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return AuthProvider( child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green[800],
        primaryColorDark: Colors.green,
        primaryColorLight: Colors.green[400],
        accentColor: Colors.green[600],
        unselectedWidgetColor: Colors.white10,
        toggleableActiveColor: Colors.green[700],
        hintColor: Colors.white10,
        disabledColor: Colors.white10,
        cursorColor:Colors.green[900],
        // Define the default font family.
        fontFamily: 'Montserrat',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 26.0, fontWeight: FontWeight.normal),
          title: TextStyle(fontSize: 26.0, fontStyle: FontStyle.normal),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),

      ),
      home: MyHomePage(title: 'FLUTTER WEB'),
    ));
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with NetigmaBaseMixin<MyHomePage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget body() {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
          RaisedButton(child:Text("don't press !"), onPressed:(){
            setState(() {
              _counter++;
            });
          },)
        ],
      ),
    );

  }

  @override
  String getTitle() {
    // TODO: implement getTitle
    return "NE T I G M A Main Page";
  }
}
