import 'package:flutter/material.dart';

import 'cat.dart';

class CatDialog extends StatefulWidget {
  const CatDialog({Key? key, required this.insertCat}) : super(key: key);
  final Future<void> Function(Cat) insertCat;

  @override
  State<CatDialog> createState() => _CatDialogState();
}

class _CatDialogState extends State<CatDialog> {
  int id = 0;
  String name = '';
  int age = 0;

  void setId(String newId) {
    id = int.parse(newId);
    setState(() {});
  }

  void setName(String newName) {
    name = newName;
    setState(() {});
  }

  void setAge(String newAge) {
    age = int.parse(newAge);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        title: const Text('Добавить 😺'),
        content: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Id'),
              onChanged: setId,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Имя'),
              onChanged: setName,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Возраст'),
              onChanged: setAge,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await widget.insertCat(
                Cat(id: id, name: name, age: age),
              );
              Navigator.pop(context);
            },
            child: const Text('Добавить'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }
}
