import 'package:flutter/material.dart';

class HeroExample extends StatelessWidget {
  const HeroExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero'),
      ),
      body: const Center(
        child: Hero(
          tag: 'Tag',
          child: FlutterLogo(
            size: 300,
          ),
        ),
      ),
    );
  }
}
