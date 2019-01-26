import 'package:curtain_transition/FirstScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final imageAsset = new AssetImage("images/the-mask.jpg");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CurtainTransition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}


