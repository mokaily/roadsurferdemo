import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:roadsurferdemo/core/providers/local_provider.dart';

void main() {
  test('localeProvider should return default Locale as en', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final locale = container.read(localeProvider);

    expect(locale.languageCode, 'en');
  });

  test('localeProvider should update Locale value', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    container.read(localeProvider.notifier).state = const Locale('de');

    final updatedLocale = container.read(localeProvider);
    expect(updatedLocale.languageCode, 'de');
  });
}
