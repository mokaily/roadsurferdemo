import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';

void main() {
  group('ScreenSizeNotifier', () {
    test('initial isdesktop should be false', () {
      final notifier = ScreenSizeNotifier();
      expect(notifier.isDesktop, false);
    });
  });
}
