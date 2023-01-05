import 'package:flutter/material.dart';
import 'package:flutter_education/data_transfer/prop_class.dart';

class DataTransferExample extends StatefulWidget {
  const DataTransferExample({Key? key}) : super(key: key);

  @override
  State<DataTransferExample> createState() => _DataTransferExampleState();
}

class _DataTransferExampleState extends State<DataTransferExample> {
  String text = '';
  bool boolean = false;
  int number = 0;

  void setText(String txt) {
    text = txt;
    setState(() {});
  }

  void setBoolean(bool? newBool) {
    if (newBool != null) {
      boolean = newBool;
    }
    setState(() {});
  }

  void setNumber(String newNumber) {
    number = int.parse(newNumber);
    setState(() {});
  }

  void goAndTransferData(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/transfer',
      arguments: Prop(number: number, boolean: boolean, text: text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Передача данных'),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: setText,
            ),
            const Text('Текст'),
            TextFormField(
              onChanged: setNumber,
              keyboardType: TextInputType.number,
            ),
            const Text('Число'),
            Checkbox(value: boolean, onChanged: setBoolean),
            const Text('Булька'),
            TextButton(
              onPressed: () => goAndTransferData(context),
              child: const Text('Перейти и передать данные'),
            ),
          ],
        ),
      ),
    );
  }
}
