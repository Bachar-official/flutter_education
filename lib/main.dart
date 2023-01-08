import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_education/app.dart';
import 'package:flutter_education/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const CounterApp());
}