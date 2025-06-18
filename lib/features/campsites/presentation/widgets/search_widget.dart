import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/dependency_injection.dart';

import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/themes/themes.dart';

class SearchWidget extends ConsumerWidget {
  final double widgetHeight;
  const SearchWidget({super.key, required this.widgetHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);
    ref.watch(campsiteNotifierProvider);

    return Container(
      height: widgetHeight,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: SearchBar(
            enabled: ref.read(campsiteNotifierProvider.notifier).campsites?.isNotEmpty ?? false,
            hintText: "Search Campsites",
            leading: const Icon(Icons.search),
            onChanged: (value) {
              print("Search value: $value");
              // ref.read(campsiteNotifierProvider.notifier).searchCampsites(value);
            },
          )),
          if (!sizeProvider.isDesktop) ...[
            const SizedBox(width: 8),
            InkWell(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 220),
                        blurRadius: 3,
                        spreadRadius: 1.7,
                        offset: const Offset(0, 2.5)),
                  ],
                  color: theme.setTheme().primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(Icons.filter_alt_outlined, color: Colors.white, size: 22),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
