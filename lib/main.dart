import 'package:flutter/material.dart';
import 'package:flutter_education/async_widget.dart';
import 'package:flutter_education/builders.dart';
import 'package:flutter_education/keys.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageNumber = 0;

  void setPage(int page) {
    pageNumber = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: setPage,
        selectedIndex: pageNumber,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.access_time), label: 'Keys'),
          NavigationDestination(
              icon: Icon(Icons.access_time), label: 'Builders'),
          NavigationDestination(
              icon: Icon(Icons.access_time), label: 'Async Widget'),
        ],
      ),
      body: [
        KeysExample(),
        BuildersExample(),
        AsyncWidgetExample(),
      ][pageNumber],
    );
  }
}
