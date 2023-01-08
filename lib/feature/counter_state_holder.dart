import 'package:flutter_riverpod/flutter_riverpod.dart';

import './counter_state.dart';

class CounterStateHolder extends StateNotifier<CounterState> {
  CounterStateHolder() : super(const CounterState.initial());

  CounterState get counterState => state;

  void setCounter(int newCounter) {
    state = state.copyWith(counter: newCounter);
  }
}