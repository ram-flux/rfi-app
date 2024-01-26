import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../index.dart';

class AppTranslations extends Translations {
  // Fall back to en_US if locale doesn't exists
  static const fallbackLocale = Locale('en', 'US');

  // Supported locales
  static Iterable<Locale> get supportedLocales => Iterable<Locale>.generate(
        Constants.languages.length,
        (index) => Locale(
          Constants.languages[index].code,
          Constants.languages[index].country,
        ),
      );

  // Localizations delegates
  static const localizationsDelegate = <LocalizationsDelegate<dynamic>>[
    RefreshLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
      };
}
