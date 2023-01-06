import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoExample extends StatelessWidget {
  const CupertinoExample({Key? key}) : super(key: key);

  void _showPopupSurface(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Заголовок'),
        message: const Text('Сообщение'),
        actions: [
          TextButton(
            onPressed: () => debugPrint('OK'),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showModal(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Заголовок'),
        content: const Text('Содержание'),
        actions: [
          TextButton(
            onPressed: () => debugPrint('OK'),
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => _showPopupSurface(context),
              child: const Text('Показать простое сообщение'),
            ),
            TextButton(
              onPressed: () => _showModal(context),
              child: const Text('Показать диалог'),
            ),
          ],
        ),
      ),
    );
  }
}
