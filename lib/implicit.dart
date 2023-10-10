import 'package:flutter/material.dart';
import 'dart:math' as math;

const duration = Duration(milliseconds: 500);
const logo = FlutterLogo();

class Implicit extends StatefulWidget {
  const Implicit({super.key});

  @override
  State<Implicit> createState() => _ImplicitState();
}

class _ImplicitState extends State<Implicit> {
  double margin = 0;
  bool fade = false;
  bool align = false;
  double opacity = 1;
  double angle = 0;

  void setMargin() {
    if (margin == 0) {
      margin = 100.0;
    } else {
      margin = 0;
    }
    setState(() {});
  }

  void setFade() {
    fade = !fade;
    setState(() {});
  }

  void setAlign() {
    align = !align;
    setState(() {});
  }

  void setOpacity() {
    if (opacity == 0) {
      opacity = 1;
    } else {
      opacity = 0;
    }
    setState(() {});
  }

  void setAngle() {
    if (angle == 0) {
      angle = 1;
    } else {
      angle = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(left: margin),
            duration: duration,
            child: GestureDetector(
              onTap: setMargin,
              child: logo,
            ),
          ),
          GestureDetector(
            onTap: setFade,
            child: AnimatedCrossFade(
                firstChild: logo,
                secondChild: const Icon(Icons.android),
                crossFadeState:
                    fade ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: duration),
          ),
          GestureDetector(
            onTap: setAlign,
            child: Center(
              child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: AnimatedAlign(
                      duration: duration,
                      alignment:
                          align ? Alignment.bottomLeft : Alignment.topRight,
                      child: logo)),
            ),
          ),
          GestureDetector(
            onTap: setOpacity,
            child: Card(
              child: AnimatedOpacity(
                  opacity: opacity, duration: duration, child: logo),
            ),
          ),
          GestureDetector(
            onTap: setAngle,
            child:
                AnimatedRotation(turns: angle, duration: duration, child: logo),
          ),
        ],
      ),
    );
  }
}
