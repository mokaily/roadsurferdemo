import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/core/providers/screen_size_provider.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';

class NoDataWidget extends ConsumerWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);

    return SliverFillRemaining(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/nodata-logo.png", height: 140),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.g_no_data,
              textAlign: TextAlign.center,
              style: theme.setTheme().textTheme.bodyMedium?.copyWith(
                fontSize: sizeProvider.isDesktop ? 20 : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
