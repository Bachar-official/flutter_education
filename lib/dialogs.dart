import 'package:flutter/material.dart';

class DialogsExample extends StatelessWidget {
  const DialogsExample({Key? key}) : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: Text('Содержание диалога'),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Заголовок диалога'),
        content: const Text('Содержание диалога'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Заголовок диалога'),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Dialog(
        child: Text('Содержание диалога'),
      ),
    );
  }

  void _showBottomAlertDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Заголовок диалога'),
        content: const Text('Содержание диалога'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showSheetDialog(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => const Dialog(
        child: Text('Содержание диалога'),
      ),
    );
  }

  void _showSheetAlertDialog(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Заголовок диалога'),
        content: const Text('Содержание диалога'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showSheetSimpleDialog(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Заголовок диалога'),
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showBottomSimpleDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Заголовок диалога'),
        children: [
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
        title: const Text('Dialogs'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () => _showDialog(context),
              child: const Text('Открыть Dialog'),
            ),
            TextButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Открыть AlertDialog'),
            ),
            TextButton(
              onPressed: () => _showSimpleDialog(context),
              child: const Text('Открыть SimpleDialog'),
            ),
            TextButton(
              onPressed: () => _showBottomDialog(context),
              child: const Text('Открыть Dialog внизу'),
            ),
            TextButton(
              onPressed: () => _showBottomAlertDialog(context),
              child: const Text('Открыть AlertDialog внизу'),
            ),
            TextButton(
              onPressed: () => _showBottomSimpleDialog(context),
              child: const Text('Открыть SimpleDialog внизу'),
            ),
            TextButton(
              onPressed: () => _showSheetDialog(context),
              child: const Text('Открыть Dialog sheet'),
            ),
            TextButton(
              onPressed: () => _showSheetAlertDialog(context),
              child: const Text('Открыть AlertDialog sheet'),
            ),
            TextButton(
              onPressed: () => _showSheetSimpleDialog(context),
              child: const Text('Открыть SimpleDialog sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
