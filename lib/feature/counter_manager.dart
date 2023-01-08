import 'counter_state_holder.dart';

class CounterManager {
  final CounterStateHolder holder;

  CounterManager({required this.holder});

  void increment() {
    int newCounter = holder.counterState.counter;
    newCounter++;
    holder.setCounter(newCounter);
  }

  void decrement() {
    int newCounter = holder.counterState.counter;
    newCounter--;
    holder.setCounter(newCounter);
  }
}