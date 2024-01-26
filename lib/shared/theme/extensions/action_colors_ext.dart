import 'package:flutter/material.dart';

/// `ThemeExtension` for custom colors.
class ActionColorsExtension extends ThemeExtension<ActionColorsExtension> {
  /// Light theme colors
  static const ActionColorsExtension light = ActionColorsExtension(
    notShown: Color(0xff619eff),
    mute: Color(0xfff09a37),
    delete: Color(0xfffe3b30),
    archive: Color(0xffbbbbc3),
    addMenu: Color(0xff619eff),
    pin: Color(0xff179c17),
  );

  /// Dark theme colors
  static const ActionColorsExtension dark = ActionColorsExtension(
    notShown: Color(0xffaac7ff),
    mute: Color(0xfffcb975),
    delete: Color(0xffffb4aa),
    archive: Color(0xffb2c5ff),
    addMenu: Color(0xffaac7ff),
    pin: Color(0xffa4d396),
  );

  /// notShown
  final Color? notShown;

  /// mute
  final Color? mute;

  /// delete
  final Color? delete;

  /// archive
  final Color? archive;

  /// addMenu
  final Color? addMenu;

  /// pin
  final Color? pin;

  const ActionColorsExtension({
    this.notShown,
    this.mute,
    this.delete,
    this.archive,
    this.addMenu,
    this.pin,
  });

  @override
  ThemeExtension<ActionColorsExtension> copyWith({
    Color? notShown,
    Color? mute,
    Color? delete,
    Color? archive,
    Color? addMenu,
    Color? pin,
  }) {
    return ActionColorsExtension(
      notShown: notShown ?? this.notShown,
      mute: mute ?? this.mute,
      delete: delete ?? this.delete,
      archive: archive ?? this.archive,
      addMenu: addMenu ?? this.addMenu,
      pin: pin ?? this.pin,
    );
  }

  @override
  ThemeExtension<ActionColorsExtension> lerp(
    covariant ThemeExtension<ActionColorsExtension>? other,
    double t,
  ) {
    if (other is! ActionColorsExtension) {
      return this;
    }

    return ActionColorsExtension(
      notShown: Color.lerp(notShown, other.notShown, t),
      mute: Color.lerp(mute, other.mute, t),
      delete: Color.lerp(delete, other.delete, t),
      archive: Color.lerp(archive, other.archive, t),
      addMenu: Color.lerp(addMenu, other.addMenu, t),
      pin: Color.lerp(pin, other.pin, t),
    );
  }

  @override
  String toString() {
    return '$runtimeType($notShown, $mute, $delete, $archive, $addMenu, $pin)';
  }
}
