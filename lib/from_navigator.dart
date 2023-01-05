import 'package:flutter/material.dart';

class FromNavigatorExample extends StatelessWidget {
  const FromNavigatorExample({Key? key}) : super(key: key);

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Переход из навигатора'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Вы пришли из Навигатора!'),
            TextButton(
              onPressed: () => goBack(context),
              child: const Text('pop'),
            ),
          ],
        ),
      ),
    );
  }
}
