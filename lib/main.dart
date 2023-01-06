import 'package:flutter/material.dart';
import 'package:flutter_education/animation.dart';
import 'package:flutter_education/dialogs.dart';
import 'package:flutter_education/menu.dart';

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
  int page = 0;

  void setPage(int newPage) {
    page = newPage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: page,
        onDestinationSelected: setPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dialer_sip_outlined), label: 'Dialogs',),
          NavigationDestination(icon: Icon(Icons.dialer_sip_outlined), label: 'Menu',),
          NavigationDestination(icon: Icon(Icons.dialer_sip_outlined), label: 'Animations',),
        ],
      ),
      body: [
        DialogsExample(),
        MenuExample(),
        DialogsAnimationExample()
      ][page],
    );
  }
}
