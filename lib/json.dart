import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_education/person.dart';

class JsonScreen extends StatelessWidget {
  JsonScreen({Key? key}) : super(key: key);

  final String jsonStr = '{"name":"Василий","birthday":"1999-31-12"}';

  Future<Person> getPerson() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      var json = jsonDecode(jsonStr);
      return Person.fromJson(json);
    });
  }

  void getAndPrintPerson() async {
    Person person = await getPerson();
    print(person);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON'),
      ),
      body: Center(
        child: TextButton(
          onPressed: getAndPrintPerson,
          child: const Text('Получить и распечатать человека'),
        ),
      ),
    );
  }
}
