import 'package:flutter/material.dart';
import 'dart:math' as math;

class DialogsAnimationExample extends StatelessWidget {
  const DialogsAnimationExample({Key? key}) : super(key: key);

  void _showAnimatedDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.4),
      barrierLabel: '',
      transitionBuilder: (context, anim1, anim2, child) {
        return Transform.rotate(
          angle: (anim1.value * math.pi * 2),
          child: AlertDialog(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: Transform.rotate(
              angle: math.pi,
              child: const Text('Янdех'),
            ),
            content: const Text('Яндекс'),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 1500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => _showAnimatedDialog(context),
            child: const Text('Показать анимированный диалог')),
      ),
    );
  }
}
