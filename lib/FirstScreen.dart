import 'package:curtain_transition/SecondScreen.dart';
import 'package:curtain_transition/main.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() {
    return new FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: "curtain",
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: imageAsset,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            child: Icon(
              Icons.chevron_right,
              size: 30,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SecondScreen())),
          ),
        )
      ],
    );
  }
}