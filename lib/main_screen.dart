import 'package:flutter/material.dart';
import 'package:flutter_education/app_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Consumer<AppModel>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          title: Text(localization.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButtonFormField<Locales>(
                  value: state.locales,
                  onChanged: state.setLocale,
                  items: [
                    DropdownMenuItem(
                      value: Locales.en,
                      child: Text(localization.eng),
                    ),
                    DropdownMenuItem(
                      value: Locales.ru,
                      child: Text(localization.ru),
                    ),
                    DropdownMenuItem(
                      value: Locales.eo,
                      child: Text(localization.eo),
                    ),
                  ],
                ),
                Expanded(
                  child: FittedBox(
                    child: Text(localization.welcome),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
