import 'package:flutter/material.dart';

class FutureScreen extends StatelessWidget {
  FutureScreen({super.key});

  void doSyncFuture() {
    print('Before the Future');
    Future(() {
      print('Running the Future');
    }).then((_) {
      print('Future is complete');
    });
    print('After the Future');
  }

  void doAsyncFuture() async {
    methodA();
    await methodB();
    await methodC('main');
    methodD();
  }

  methodA() {
    print('A');
  }

  methodB() async {
    print('B start');
    await methodC('B');
    print('B end');
  }

  methodC(String from) async {
    print('C start from $from');

    Future(() {
      // <== Этот код будет исполнен когда-то в будущем
      print('C running Future from $from');
    }).then((_) {
      print('C end of Future from $from');
    });

    print('C end from $from');
  }

  methodD() {
    print('D');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: doSyncFuture,
            child: const Text('Синхронный Future'),
          ),
          TextButton(
            onPressed: doAsyncFuture,
            child: const Text('Асинхронный Future'),
          ),
        ],
      ),
    );
  }
}
