import 'package:flutter/material.dart';
import 'package:flutter_education/grid_view.dart';
import 'package:flutter_education/list_view.dart';
import 'package:flutter_education/page_view.dart';
import 'package:flutter_education/single_scroll_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pageNumber = 0;

  void setPage(int number) {
    pageNumber = number;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageNumber,
        onDestinationSelected: setPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add_to_home_screen_sharp), label: 'SingleChildScrollView'),
          NavigationDestination(icon: Icon(Icons.add_to_home_screen_sharp), label: 'ListView'),
          NavigationDestination(icon: Icon(Icons.add_to_home_screen_sharp), label: 'GridView'),
          NavigationDestination(icon: Icon(Icons.add_to_home_screen_sharp), label: 'PageView'),
        ],
      ),
      body: [
        SingleScroll(),
        ListViewExample(),
        GridViewExample(),
        PageViewExample()
      ][pageNumber],
    );
  }
}
