import '../index.dart';

/// 常量
class Constants {
  // Storage keys
  static const String storageKeyThemeMode = 'theme_mode';
  static const String storageKeyCountryCode = 'country_code';
  static const String storageKeyLanguageCode = 'language_code';

  // Locale languages
  // flag: https://emojipedia.org/flags
  static const List<LanguageModel> languages = [
    LanguageModel(
      code: 'en',
      name: 'English',
      flag: '🇺🇸',
      country: 'US',
    ),
    LanguageModel(
      code: 'zh',
      name: '中文',
      flag: '🇨🇳',
      country: 'CN',
    ),
  ];
}
