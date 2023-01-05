import 'package:flutter/material.dart';

class BuildersExample extends StatelessWidget {
  const BuildersExample({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Пыщь!'),
      ),
    );
  }

  Future<String> getFutureString() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return 'Хоба!';
      //throw Exception('Ай-яй-яй!');
    });
  }

  Stream<String> getStream() => Stream.periodic(
        const Duration(seconds: 1),
        (count) {
          if (count % 10 == 0) {
            return '$count делится на десять!';
          }
          if (count % 3 == 0) {
            return '$count делится на три!';
          }
          return '$count';
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Builders'),
      ),
      // body: Center(
      //   child: Builder(
      //     builder: (context) => TextButton(
      //       onPressed: () => showSnackBar(context),
      //       child: const Text('Показать пыщь'),
      //     ),
      //   ),
      // ),

      // body: LayoutBuilder(
      //   builder: (context, constraints) {
      //     print(constraints.maxHeight);
      //     print(constraints.maxWidth);
      //     return const Card(child: Text('Хоба'));
      //   },
      // ),

      // body: FutureBuilder(
      //   future: getFutureString(),
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.waiting:
      //         return const CircularProgressIndicator();
      //       case ConnectionState.done:
      //         return snapshot.hasError ? Text(snapshot.error.toString()) : Text(snapshot.data!);
      //       default:
      //         return const SizedBox.shrink();
      //     }
      //   },
      // ),

      // body: StreamBuilder<String>(
      //   stream: getStream(),
      //   builder: (context, snapshot) => Text(snapshot.data ?? ''),
      // ),
    );
  }
}
