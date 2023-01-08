import 'package:flutter/cupertino.dart';
import 'package:flutter_education/feature/counter_manager.dart';
import 'package:flutter_education/feature/counter_state_holder.dart';

class DI {
  late CounterStateHolder holder;
  late CounterManager manager;

  DI() {
    holder = CounterStateHolder();
    manager = CounterManager(holder: holder);
  }

  void init() {
    debugPrint('DI initialized');
  }
}

final di = DI();