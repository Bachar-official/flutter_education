import 'package:flutter/material.dart' hide Actions;
import 'package:flutter_education/actions.dart';
import 'package:redux/redux.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.store});

  final Store<int> store;

  Widget renderWidget(int state) => Text('Значение счётчика: $state');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redux Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: store.onChange,
          builder: (context, snapshot) => renderWidget(snapshot.data ?? 0),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => store.dispatch(Actions.increment),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => store.dispatch(Actions.decrement),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
