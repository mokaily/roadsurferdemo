import 'package:flutter/material.dart';
import 'package:roadsurferdemo/core/themes/theme_utils.dart';
import 'color_palettes.dart';

class Themes {
  BuildContext baseContext;

  Themes({required this.baseContext});

  static final lightTheme = ThemeData(
    primarySwatch: createMaterialColor(ColorPalettes.primary),
    useMaterial3: true,
    fontFamily: 'EncodeSans',
    primaryColor: ColorPalettes.primary,
    primaryColorDark: ColorPalettes.secondary,
    scaffoldBackgroundColor: Colors.white,
    dividerColor: const Color(0xffEAECF0),
    shadowColor: ColorPalettes.secondary.withValues(alpha: 120),
    textTheme: TextTheme(
      headlineLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 45, color: Colors.white),
      headlineMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 28, color: ColorPalettes.primary),
      headlineSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: ColorPalettes.primary),
      displayLarge: TextStyle(fontWeight: FontWeight.w300, fontSize: 30, color: ColorPalettes.secondary),
      displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: ColorPalettes.secondary),
      displaySmall: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: ColorPalettes.secondary),
      bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: ColorPalettes.secondary),
      labelLarge: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: ColorPalettes.secondary),
      labelSmall: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorPalettes.primary,
      selectionColor: ColorPalettes.primary.withValues(alpha: 0.5),
      selectionHandleColor: ColorPalettes.primary,
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
      textStyle: TextStyle(fontWeight: FontWeight.w500, color: ColorPalettes.secondary),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(ColorPalettes.primary),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: ColorPalettes.secondary,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
      focusColor: Colors.transparent,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      splashColor: Colors.transparent,
      highlightElevation: 0,
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: const WidgetStatePropertyAll(3),
      backgroundColor: const WidgetStatePropertyAll(Colors.white),
      shadowColor: const WidgetStatePropertyAll(Colors.white),
      overlayColor: const WidgetStatePropertyAll(Colors.white),
      textStyle: WidgetStateProperty.all(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorPalettes.secondary),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: ColorPalettes.primary.withValues(alpha: 0.7),
      inactiveTrackColor: ColorPalettes.primary.withValues(alpha: 0.2),
      thumbColor: ColorPalettes.primary,
      overlayColor: ColorPalettes.primary.withValues(alpha: 0.2),
      valueIndicatorColor: ColorPalettes.primary,
      trackHeight: 20,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5, pressedElevation: 7),
      trackShape: const RoundedRectSliderTrackShape(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        visualDensity: VisualDensity.standard,
        padding: const EdgeInsets.symmetric(vertical: 6),
        iconSize: 18,
        foregroundColor: Colors.white,
        backgroundColor: ColorPalettes.primary,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorPalettes.primary;
        }
        if (states.contains(WidgetState.hovered)) {
          return ColorPalettes.primary.withValues(alpha: 0.2);
        }
        return Colors.white;
      }),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      visualDensity: VisualDensity.standard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorPalettes.primary;
        }
        if (states.contains(WidgetState.hovered)) {
          return Colors.black87.withValues(alpha: 0.5);
        }
        return Colors.black87;
      }),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      visualDensity: VisualDensity.standard,
      splashRadius: 20,
    ),
  );

  ThemeData setTheme() => Theme.of(baseContext);
}
