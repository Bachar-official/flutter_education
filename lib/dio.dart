import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioScreen extends StatelessWidget {
  const DioScreen({Key? key}) : super(key: key);

  void dioRequest() async {
    var response = await Dio().get('http://osu.ru');
    print(response.statusCode);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DIO'),
        ),
        body: Center(
          child: TextButton(
            onPressed: dioRequest,
            child: const Text('Запрос к osu.ru через dio'),
          ),
        ));
  }
}
