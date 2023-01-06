import 'package:flutter/material.dart';
import 'package:flutter_education/database.dart';
import 'package:flutter_education/file.dart';
import 'package:flutter_education/hive.dart';

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
            NavigationDestination(
                icon: Icon(Icons.file_present), label: 'File'),
            NavigationDestination(
                icon: Icon(Icons.hive_outlined), label: 'Hive'),
            NavigationDestination(icon: Icon(Icons.dataset), label: 'Database'),
          ],
        ),
        body: [
          FileExample(),
          HiveExample(),
          DatabaseExample(),
        ][page]);
  }
}
