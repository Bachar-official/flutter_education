import 'package:flutter/material.dart';
import 'package:flutter_education/explicit.dart';
import 'package:flutter_education/implicit.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;

  void onSelected(int page) {
    _page = page;
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onSelected,
        selectedIndex: _page,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.abc), label: 'Implicit'),
          NavigationDestination(icon: Icon(Icons.abc), label: 'Explicit'),
        ],
      ),
      body: const [Implicit(), Explicit()][_page],
    );
  }
}
