import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/dependency_injection.dart';

import '../../../../core/providers/screen_size_provider.dart';
import '../../../../core/themes/themes.dart';
import 'filter/filter_widget.dart';

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
            enabled: ref.watch(campsiteNotifierProvider.notifier).campsites.isNotEmpty,
            hintText: "Search Campsites",
            controller: ref.watch(campsiteNotifierProvider.notifier).searchController,
            leading: const Icon(Icons.search),
            onChanged: (value) {
              ref.read(campsiteNotifierProvider.notifier).searchCampsites(value);
            },
          )),
          if (!sizeProvider.isDesktop) ...[
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                openSideScreen(context);
              },
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

void openSideScreen(BuildContext context) {
  showModalBottomSheet(
    enableDrag: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black45,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: const FiltersScreen(),
            ),
          ),
        ],
      );
    },
  );
}
