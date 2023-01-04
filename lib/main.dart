import 'package:flutter/material.dart';
import 'package:flutter_education/dio.dart';
import 'package:flutter_education/future.dart';
import 'package:flutter_education/http.dart';
import 'package:flutter_education/json.dart';

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

  void setPage(int page) {
    pageNumber = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: setPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.adb_sharp), label: 'Future'),
          NavigationDestination(icon: Icon(Icons.adb_sharp), label: 'HTTP'),
          NavigationDestination(icon: Icon(Icons.adb_sharp), label: 'DIO'),
          NavigationDestination(icon: Icon(Icons.adb_sharp), label: 'JSON'),
        ],
      ),
      body: [
        FutureScreen(),
        HttpScreen(),
        DioScreen(),
        JsonScreen()
      ][pageNumber],
    );
  }
}
