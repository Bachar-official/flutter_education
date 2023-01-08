import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_education/widgets.dart';

Widget directWrapper(Widget child) => Directionality(
      textDirection: TextDirection.ltr,
      child: child,
    );

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      directWrapper(
        const NumCard(
          number: 3,
        ),
      ),
    );

    final numberFinder = find.text(
      3.toString(),
    );
    expect(numberFinder, findsOneWidget);
  });
}
