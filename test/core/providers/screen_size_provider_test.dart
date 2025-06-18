import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/providers/screen_size_provider.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';

void main() {
  test('screenSizeProvider should return a ScreenSizeNotifier instance', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final notifier = container.read(screenSizeProvider);

    expect(notifier, isA<ScreenSizeNotifier>());
    expect(notifier.isDesktop, false);
  });
}
