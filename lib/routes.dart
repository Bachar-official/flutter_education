import 'package:flutter/material.dart';

class RoutesExample extends StatelessWidget {
  const RoutesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/route1'),
              child: const Text('go to Route1'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/route2'),
              child: const Text('go to Route2'),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/exception'),
              child: const Text('Сломать приложение'),
            ),
          ],
        ),
      ),
    );
  }
}
