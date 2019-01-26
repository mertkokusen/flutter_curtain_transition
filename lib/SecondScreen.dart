import 'package:curtain_transition/CrossClipper.dart';
import 'package:curtain_transition/main.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() {
    return new SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen>
    with TickerProviderStateMixin {
  AnimationController controller;

  CurvedAnimation curve;
  Animation<double> curtainOffset;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    curve = CurvedAnimation(parent: controller, curve: Curves.elasticIn);

    curtainOffset = Tween(begin: 0.0, end: 500.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(
        const Duration(milliseconds: 300), () => controller.forward());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.controller.isCompleted
            ? this.controller.reverse()
            : this.controller.forward();
      },
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.pink,
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                'Second page',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Hero(
            tag: "curtain",
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0, -curtainOffset.value),
                  child: ClipPath(
                    clipper: CrossClipper(),
                    child: Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: imageAsset,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, curtainOffset.value),
                  child: ClipPath(
                    clipper: CrossClipper(showTop: false),
                    child: Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: imageAsset,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
