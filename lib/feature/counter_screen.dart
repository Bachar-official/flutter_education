import 'package:flutter/material.dart';
import 'package:flutter_education/feature/counter_state.dart';
import 'package:flutter_education/feature/counter_state_holder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di.dart';

final counterProvider =
    StateNotifierProvider<CounterStateHolder, CounterState>((ref) => di.holder);

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);
    final manager = di.manager;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EvA Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: manager.increment,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: manager.decrement,
          ),
        ],
      ),
      body: Center(
        child: Text('Значение счётчика: ${state.counter}'),
      ),
    );
  }
}
