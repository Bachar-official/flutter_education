import 'package:flutter/material.dart';

class ListViewExample extends StatelessWidget {
  ListViewExample({super.key});

  final List<Widget> cards = List.generate(
      10,
      (index) => Card(
            child: Text('Карточка номер $index'),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: ListView(
        children: cards,
      ),

      // body: ListView.builder(
      //   itemBuilder: (context, index) => cards[index],
      //   itemCount: cards.length,
      // ),

      // body: ListView.separated(
      //     itemBuilder: (context, index) => cards[index],
      //     separatorBuilder: (context, index) => Text('Разделитель №$index'),
      //     itemCount: cards.length),
      
      // body: ListView.custom(childrenDelegate: SliverChildBuilderDelegate(
      //     (context, index) => cards[index],
      //     childCount: cards.length,
      // ))
    );
  }
}
