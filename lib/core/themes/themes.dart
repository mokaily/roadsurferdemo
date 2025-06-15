import 'package:flutter/material.dart';
import 'package:roadsurferdemo/core/themes/theme_utils.dart';
import 'color_palettes.dart';

class Themes {
  BuildContext baseContext;

  Themes({required this.baseContext});

  static final lightTheme = ThemeData(
    primarySwatch: createMaterialColor(ColorPalettes.primary),
    useMaterial3: false,
    fontFamily: 'EncodeSans',
    primaryColor: ColorPalettes.primary,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: const Color(0xffEAECF0),
    shadowColor: ColorPalettes.secondary.withValues(alpha: 120),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontWeight: FontWeight.w700, fontSize: 32, color: ColorPalettes.primary),
      headlineMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 28, color: ColorPalettes.primary),
      headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: ColorPalettes.primary),
      displayLarge: TextStyle(fontWeight: FontWeight.w300, fontSize: 30, color: ColorPalettes.secondary),
      displayMedium: TextStyle(fontWeight: FontWeight.w700, fontSize: 26, color: ColorPalettes.secondary),
      displaySmall: TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: ColorPalettes.secondary),
    ),
    appBarTheme: AppBarTheme(
      titleSpacing: 50,
      backgroundColor: ColorPalettes.primary,
      foregroundColor: ColorPalettes.secondary,
      elevation: 0,
      shadowColor: ColorPalettes.secondary.withValues(alpha: 120),
      toolbarHeight: 60,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      suffixIconColor: ColorPalettes.secondary,
      focusColor: Colors.transparent,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorPalettes.secondary,
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorPalettes.primary),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
      ),
    ),
  );

  setTheme() => Theme.of(baseContext);
}
