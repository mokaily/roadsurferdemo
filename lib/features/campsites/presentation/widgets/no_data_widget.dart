import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';

import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/themes/themes.dart';

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
          Image.asset("assets/nodata-logo.png", height: 120),
          SizedBox(height: 10),
          Text(
            "Ooops, looks like we don't have any campsites available.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: sizeProvider.isDesktop ? 25 : 15, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      )),
    );
  }
}
