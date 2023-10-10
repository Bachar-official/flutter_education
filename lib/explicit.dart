import 'package:flutter/material.dart';

class Explicit extends StatefulWidget {
  const Explicit({super.key});

  @override
  State<Explicit> createState() => _ExplicitState();
}

class _ExplicitState extends State<Explicit>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        // if (controller.isCompleted) {
        //   controller.reverse();
        // } else if (controller.isDismissed) {
        //   controller.forward();
        // }

        // print(animation.value);
        setState(() {});
      });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
