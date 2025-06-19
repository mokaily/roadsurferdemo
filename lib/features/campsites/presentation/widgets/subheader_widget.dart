import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';

class SubHeaderWidget extends ConsumerWidget {
  const SubHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.g_sub_header_title,
            style: theme.setTheme().textTheme.headlineSmall?.copyWith(
              color: theme.setTheme().primaryColorDark
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.g_sub_header_subtitle,
            style: theme.setTheme().textTheme.displaySmall?.copyWith(
                color: theme.setTheme().primaryColorDark.withValues(alpha: 0.9),
              fontWeight: FontWeight.w300
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
