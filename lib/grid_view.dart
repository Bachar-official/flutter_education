import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  GridViewExample({super.key});

  final List<Widget> cards = List.generate(
    10,
    (index) => Card(
      child: Text('Карточка номер $index'),
    ),
  );

  //GridView.count
  //GridView.extent

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   children: cards,
      // ),
      body: GridView.extent(maxCrossAxisExtent: 10, children: cards,),
    );
  }
}
