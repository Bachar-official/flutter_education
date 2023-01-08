import 'package:flutter/cupertino.dart';
import 'package:flutter_education/functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => {
    debugPrint('Тут подготовка к тестам')
  });

  group('Тестирование функций', () {
    test('должен складывать', () {
      var c = sum(1, 2);
      expect(c, 3);
    });

    test('должен вычитать', () {
      var c = diff(1, 2);
      expect(c, -1);
    });

    test('должен умножать', () {
      var c = mul(1, 2);
      expect(c, 2);
    });

    test('должен делить', () {
      var c = div(1, 2);
      expect(c, 0.5);
    });
  });

  tearDown(() => {
    debugPrint('Тут освобождение ресурсов')
  });
}
