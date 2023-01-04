import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatelessWidget {
  const HttpScreen({Key? key}) : super(key: key);

  void httpRequest() async {
    var response = await http.get(Uri.parse('http://osu.ru'));
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP')),
      body: Center(
        child: TextButton(
          onPressed: httpRequest,
          child: const Text('Сделать http запрос на osu.ru'),
        ),
      ),
    );
  }
}
