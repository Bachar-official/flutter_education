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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () => _showPopupSurface(context),
                child: const Text('Показать простое сообщение'),
              ),
              CupertinoButton(
                onPressed: () => _showModal(context),
                child: const Text('Показать диалог'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
