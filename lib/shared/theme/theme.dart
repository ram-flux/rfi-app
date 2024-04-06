import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'index.dart';

class AppTheme {
  static ThemeData get light => FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff578ee6),
            primaryContainer: Color(0xffffffff),
            secondary: Color(0xffb3b2b2),
            secondaryContainer: Color(0xfff2f2f2),
            tertiary: Color(0xffefeff0),
            tertiaryContainer: Color(0xfff8f8fb),
            appBarColor: Color(0xfff2f2f2),
            error: Color(0xffb00020),
          ),
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 6,
          appBarStyle: FlexAppBarStyle.surface,
          surfaceTint: const Color(0xff578ee6),
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
            filledButtonRadius: 6.0,
            elevatedButtonRadius: 6.0,
            outlinedButtonRadius: 6.0,
            popupMenuSchemeColor: SchemeColor.primaryContainer,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          keyColors: const FlexKeyColors(
            keepPrimary: true,
            keepSecondary: true,
            keepTertiary: true,
            keepPrimaryContainer: true,
            keepTertiaryContainer: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          fontFamily: GoogleFonts.poppins().fontFamily,

          // Theme extensions
          extensions: [
            ActionColorsExtension.light,
          ]).copyWith(
        pageTransitionsTheme: _getPageTransitionsTheme(),
      );

  static ThemeData get dark => FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xffc4d7f8),
            primaryContainer: Color(0xff577cbf),
            secondary: Color(0xffbcc7dc),
            secondaryContainer: Color(0xff3d4758),
            tertiary: Color(0xffdde5f5),
            tertiaryContainer: Color(0xff7297d9),
            appBarColor: Color(0xff3d4758),
            error: Color(0xffcf6679),
          ),
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 13,
          appBarStyle: FlexAppBarStyle.surface,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
            filledButtonRadius: 6.0,
            elevatedButtonRadius: 6.0,
            outlinedButtonRadius: 6.0,
            popupMenuSchemeColor: SchemeColor.primaryContainer,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          keyColors: const FlexKeyColors(
            keepPrimary: true,
            keepTertiary: true,
            keepTertiaryContainer: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
          // To use the Playground font, add GoogleFonts package and uncomment
          fontFamily: GoogleFonts.poppins().fontFamily,

          // Theme extensions
          extensions: [
            ActionColorsExtension.dark,
          ]).copyWith(
        pageTransitionsTheme: _getPageTransitionsTheme(),
      );

  static PageTransitionsTheme _getPageTransitionsTheme() =>
      const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );
}
