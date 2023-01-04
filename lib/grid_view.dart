import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  GridViewExample({super.key});

  final List<Widget> cards = List.generate(
    10,
    (index) => Card(
      child: Text('Карточка номер $index'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),

      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        children: cards,
      ),

      // body: GridView.count(
      //   crossAxisCount: 2,
      //   children: cards,
      // ),

      // body: GridView.extent(
      //   maxCrossAxisExtent: 100,
      //   /*Максимальный размер карточки в пикселях*/
      //   children: cards,
      // ),

      // body: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //     ),
      //     itemBuilder: (context, index) => cards[index]),

      // body: GridView.custom(
      //   gridDelegate:
      //       const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   childrenDelegate:
      //       SliverChildBuilderDelegate((context, index) => cards[index]),
      // ),
    );
  }
}
