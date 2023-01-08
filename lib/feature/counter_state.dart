import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int counter;

  const CounterState({required this.counter});

  const CounterState.initial() : counter = 0;

  CounterState copyWith({int? counter}) =>
      CounterState(counter: counter ?? this.counter);
}
