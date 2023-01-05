import 'package:flutter/material.dart';
import 'package:flutter_education/animation.dart';
import 'package:flutter_education/data_transfer.dart';
import 'package:flutter_education/data_transfer/data_receiver_example.dart';
import 'package:flutter_education/from_routes/route1.dart';
import 'package:flutter_education/navigator.dart';
import 'package:flutter_education/routes.dart';

import 'from_routes/route2.dart';

void main() {
  runApp(const MyApp());
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, settings) {
  return MaterialPageRoute(settings: settings, builder: builder);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/route1': return _buildRoute((context) => Route1Example(), settings);
    case '/route2': return _buildRoute((context) => Route2Example(), settings);
    case '/transfer': return _buildRoute((context) => DataTransferReceiver(), settings);
    default: throw Exception('Unknown route: ${settings.name}');
  }
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
      onGenerateRoute: generateRoute,
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
          NavigationDestination(icon: Icon(Icons.add), label: 'Navigator'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Routes'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Data transfer'),
          NavigationDestination(icon: Icon(Icons.add), label: 'Animation'),
        ],
      ),
      body: [
        NavigatorExample(),
        RoutesExample(),
        DataTransferExample(),
        AnimationExample()
      ][page],
    );
  }
}
