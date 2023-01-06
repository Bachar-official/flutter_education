import 'package:flutter/material.dart';

class MenuExample extends StatefulWidget {
  const MenuExample({Key? key}) : super(key: key);

  @override
  State<MenuExample> createState() => _MenuExampleState();
}

class _MenuExampleState extends State<MenuExample> {
  Offset _tapPosition = Offset.zero;

  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    setState(() {
      _tapPosition = referenceBox.globalToLocal(details.globalPosition);
    });
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,
        position: RelativeRect.fromRect(
          Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
          Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
              overlay.paintBounds.size.height),
        ),
        items: [
          const PopupMenuItem(
            value: 'хоба',
            child: Text('Написать в консоли "Хоба"'),
          ),
        ]);

    switch (result) {
      case 'хоба':
        debugPrint('Хоба!');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: _getTapPosition,
          onLongPress: () => _showContextMenu(context),
          child: const FlutterLogo(
            size: 50,
          ),
        ),
      ),
    );
  }
}
