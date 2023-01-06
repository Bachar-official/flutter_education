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
          CupertinoButton(
            onPressed: () => debugPrint('OK'),
            child: const Text('OK'),
          ),
        ],
        cancelButton: CupertinoButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
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
          CupertinoButton(
            onPressed: () => debugPrint('OK'),
            child: const Text('OK'),
          ),
          CupertinoButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (value) => debugPrint(
          value.toString(),
        ),
        children: List<Widget>.generate(
          10,
          (index) => Text('Вариант $index'),
        ),
      ),
    );
  }

  void _printDuration(Duration duration) {
    debugPrint('${duration.inSeconds} секунд');
  }

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CupertinoTimerPicker(
        onTimerDurationChanged: _printDuration,
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
              CupertinoButton(
                onPressed: () => _showPicker(context),
                child: const Text('Показать picker'),
              ),
              CupertinoButton(
                onPressed: () => _showTimePicker(context),
                child: const Text('Показать TimePicker'),
              ),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CupertinoContextMenu(
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        onPressed: () {
                          debugPrint('Скопировано');
                          Navigator.pop(context);
                        },
                        isDefaultAction: true,
                        trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                        child: const Text('Copy'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          debugPrint('Расшарено');
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.share,
                        child: const Text('Share'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          debugPrint('Добавлено в избранные');
                          Navigator.pop(context);
                        },
                        trailingIcon: CupertinoIcons.heart,
                        child: const Text('Favorite'),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {
                          debugPrint('Удалено');
                          Navigator.pop(context);
                        },
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        child: const Text('Delete'),
                      ),
                    ],
                    child: Container(
                      color: CupertinoColors.systemYellow,
                      child: const FlutterLogo(size: 500.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
