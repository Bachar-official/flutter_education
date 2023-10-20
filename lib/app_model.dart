import 'package:flutter/material.dart';

enum Locales { ru, en, eo }

class AppModel extends ChangeNotifier {
  Locales locales = Locales.en;

  void setLocale(Locales? locale) {
    if (locale != null) {
      locales = locale;
      notifyListeners();
    }
  }
}
