import 'package:flutter/material.dart';
import 'package:ramflux_app/shared/index.dart';

/// Here you should define getters for your `ThemeExtension`s.
///
/// Never use `Theme.of(context).extension<MyColors>()!`
/// how they do it in the [official documentation](https://api.flutter.dev/flutter/material/ThemeExtension-class.html),
/// because it's not safe. Always create a getter for your `ThemeExtension` and use it instead.
///
/// Usage example: `Theme.of(context).actionColors`.
extension AppThemeExtension on ThemeData {
  ActionColorsExtension get actionColors =>
      extension<ActionColorsExtension>() ?? ActionColorsExtension.light;
}
