import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  // Theme mode
  final RxBool _isDarkThemeMode = Get.isDarkMode.obs;
  bool get isDarkThemeMode => _isDarkThemeMode.value;

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  // Localization
  Locale locale = PlatformDispatcher.instance.locale;

  @override
  void onReady() {
    super.onReady();
    initThemeMode();
    initLocale();
  }

  // Toggle theme mode
  Future<void> toggleThemeMode() async {
    _isDarkThemeMode.value = !_isDarkThemeMode.value;
    Get.changeThemeMode(
      _isDarkThemeMode.value ? ThemeMode.dark : ThemeMode.light,
    );
  }

  // Set locale
  void setLocale(Locale locale) {
    this.locale = locale;
    Get.updateLocale(locale);
    Storage().setString(Constants.storageKeyLanguageCode, locale.languageCode);
    Storage().setString(
      Constants.storageKeyCountryCode,
      locale.countryCode ?? '',
    );
  }

  // Initialize theme mode
  void initThemeMode() {
    String themeMode = Storage().getString(Constants.storageKeyThemeMode);
    if (themeMode.isEmpty) return;

    _isDarkThemeMode.value = themeMode == 'dark';
    _themeMode.value = themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(_themeMode.value);
  }

  // Initialize locale
  void initLocale() {
    String languageCode = Storage().getString(Constants.storageKeyLanguageCode);
    if (languageCode.isEmpty) return;

    locale = AppTranslations.supportedLocales.firstWhere(
      (locale) => locale.languageCode == languageCode,
      orElse: () => AppTranslations.fallbackLocale,
    );
  }
}
