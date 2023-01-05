import 'package:flutter/material.dart';
import 'package:flutter_education/hero.dart';

import 'from_navigator.dart';

class AnimationExample extends StatelessWidget {
  const AnimationExample({Key? key}) : super(key: key);

  void navigate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, endAnimation) =>
            FromNavigatorExample(),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => navigate(context),
              child: const Text('Перейти с анимацией'),
            ),
            Hero(
              tag: 'Tag',
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeroExample(),
                  ),
                ),
                child: const FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            const Text('Hero анимация ↑'),
          ],
        ),
      ),
    );
  }
}
