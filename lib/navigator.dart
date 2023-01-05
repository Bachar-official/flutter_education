import 'package:flutter/material.dart';
import 'package:flutter_education/from_navigator.dart';

class NavigatorExample extends StatelessWidget {
  const NavigatorExample({Key? key}) : super(key: key);

  void navigate(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FromNavigatorExample(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => navigate(context),
            child: const Text('push'),
          ),
        ],
      ),
    );
  }
}
