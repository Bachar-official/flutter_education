import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  PageViewExample({super.key});

  final List<Widget> pages = List.generate(
    5,
    (index) => Card(child: Text('Страница №$index')),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),

      body: PageView(
        children: pages,
      ),

      // body: PageView.builder(
      //   itemBuilder: (context, index) => pages[index],
      //   itemCount: pages.length,
      // ),

      // body: PageView.custom(
      //   childrenDelegate: SliverChildBuilderDelegate(
      //     (context, index) => pages[index],
      //     childCount: pages.length,
      //   ),
      // ),
    );
  }
}
