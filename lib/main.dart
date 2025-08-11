import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/utils/constants.dart';

import 'core/providers/local_provider.dart';
import 'core/providers/screen_size_provider.dart';
import 'core/themes/themes.dart';
import 'features/campsites/presentation/pages/campsites_page.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => ref.read(screenSizeProvider).updateSize(context),
    );

    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: Constants.kName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: Themes.lightTheme,
      themeMode: ThemeMode.system,
      home: const CampsitesPage(),
    );
  }
}
