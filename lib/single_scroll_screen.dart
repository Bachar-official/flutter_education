import 'package:flutter/material.dart';

class SingleScroll extends StatelessWidget {
  SingleScroll({super.key});

  final List<Widget> cards = List.generate(
      10,
      (index) => Card(
            child: Text('Карточка номер $index'),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SingleChildScrollView'),
      ),
      body: Column(
        children: cards,
      ),
    );
  }
}
