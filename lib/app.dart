import 'package:flutter/material.dart';
import 'package:flutter_education/reducer.dart';
import 'package:redux/redux.dart';

import 'home.dart';
import 'middleware.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final store = Store<int>(
    counterReducer,
    initialState: 0,
    middleware: [loggingMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        store: store,
      ),
    );
  }
}
