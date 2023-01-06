import 'package:flutter/material.dart';
import 'package:flutter_education/entity/cat.dart';

class CatCard extends StatelessWidget {
  const CatCard({Key? key, required this.cat, required this.deleteCat})
      : super(key: key);
  final Cat cat;
  final Future<void> Function(int) deleteCat;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            cat.id.toString(),
          ),
          Column(
            children: [
              Text('Зовут ${cat.name}'),
              Text('Возраст ${cat.age}'),
            ],
          ),
          IconButton(
            onPressed: () => deleteCat(cat.id),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
