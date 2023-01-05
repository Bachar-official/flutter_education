import 'package:flutter/material.dart';
import 'package:flutter_education/data_transfer/prop_class.dart';

class DataTransferReceiver extends StatelessWidget {
  const DataTransferReceiver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Prop props = ModalRoute.of(context)?.settings.arguments as Prop;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Получение данных'),
      ),
      body: Center(child: Column(
        children: [
          Text('Текст: ${props.text}'),
          Text('Число: ${props.number}'),
          Text('Булька: ${props.boolean}'),
        ],
      ),),
    );
  }
}
