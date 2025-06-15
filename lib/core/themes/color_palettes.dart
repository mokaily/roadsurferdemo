import 'package:flutter/material.dart';

class ColorPalettes {
  static final ColorPalettes _instance = ColorPalettes._();

  static Color primary = const Color(0xff6bbbae);
  static Color secondary = const Color(0xff2a2a29);
  static Color yellow = const Color(0xfff7b11a);

  ColorPalettes._();

  factory ColorPalettes() => _instance;
}
