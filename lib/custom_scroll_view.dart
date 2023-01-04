import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomScrollExample extends StatelessWidget {
  CustomScrollExample({super.key});

  final List<Widget> greyItems = List.generate(
    3,
    (index) => Card(
      color: Colors.grey,
      child: Text('Карточка №$index'),
    ),
  );

  final List<Widget> greenItems = List.generate(
    3,
    (index) => Card(
      color: Colors.lightGreen,
      child: Text('Карточка №$index'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomScrollView'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => greyItems[index],
              childCount: greyItems.length,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (context, index) => greenItems[index],
                childCount: greenItems.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
          ),
          SliverToBoxAdapter(
            child: greyItems[0],
          ),
          SliverFillRemaining(
            child: greenItems[1],
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => greyItems[index],
              childCount: greyItems.length,
            ),
            itemExtent: 50,
          ),
          SliverPersistentHeader(delegate: Delegate())
        ],
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  Delegate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.yellow,
      child: const Center(child: FlutterLogo()),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
