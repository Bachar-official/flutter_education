import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveExample extends StatefulWidget {
  const HiveExample({Key? key}) : super(key: key);

  @override
  State<HiveExample> createState() => _HiveExampleState();
}

class _HiveExampleState extends State<HiveExample> {
  String text = '';
  Box settingsBox = Hive.box('settings');
  final TextEditingController _controller = TextEditingController();

  void _readSettings() {
    text = settingsBox.get('text', defaultValue: '');
    setState(() {});
    _controller.text = text;
  }

  void _writeSettings() async {
    await settingsBox.put('text', text);
  }

  void setText(String newText) {
    text = newText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: setText,
              maxLines: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _readSettings,
                  child: const Text('Прочитать из Hive'),
                ),
                TextButton(
                  onPressed: _writeSettings,
                  child: const Text('Записать в Hive'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
