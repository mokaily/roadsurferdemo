import 'package:flutter/material.dart';

class ScreenSizeNotifier extends ChangeNotifier {
  bool _isDesktop = false;

  bool get isDesktop => _isDesktop;

  void updateSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final newIsDesktop = width > 600;

    if (_isDesktop != newIsDesktop) {
      _isDesktop = newIsDesktop;
      notifyListeners();
    }
  }
}
