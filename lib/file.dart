import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class FileExample extends StatefulWidget {
  const FileExample({Key? key}) : super(key: key);

  @override
  State<FileExample> createState() => _FileExampleState();
}

class _FileExampleState extends State<FileExample> {
  String text = '';
  final TextEditingController _controller = TextEditingController(text: '');

  void _write() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/file.txt');
    await file.writeAsString(text);
  }

  Future<void> _read() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      debugPrint(directory.path);
      final File file = File('${directory.path}/file.txt');
      text = await file.readAsString();
      _controller.text = text;
      setState(() {});
    } catch (e) {
      debugPrint('Невозможно прочитать файл');
    }
  }

  void onTextChange(String newText) {
    text = newText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              maxLines: 8,
              controller: _controller,
              onChanged: onTextChange,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _read,
                  child: const Text('Прочитать из файла'),
                ),
                TextButton(
                  onPressed: _write,
                  child: const Text('Записать в файл'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
