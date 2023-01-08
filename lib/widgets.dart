import 'package:flutter/material.dart';

class NumCard extends StatelessWidget {
  const NumCard({Key? key, required this.number}) : super(key: key);

  final num number;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        number.toString(),
      ),
    );
  }
}
