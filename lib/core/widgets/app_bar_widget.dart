import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/screen_size_notifier.dart';
import '../providers/screen_size_provider.dart';
import 'language_dropdown_widget.dart';

class CampsiteAppBarWidget extends ConsumerStatefulWidget  implements PreferredSizeWidget {
  const CampsiteAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  ConsumerState<CampsiteAppBarWidget> createState() => _CampsiteAppBarWidgetState();
}

class _CampsiteAppBarWidgetState extends ConsumerState<CampsiteAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);

    return AppBar(
      toolbarHeight: 60,
      elevation: 0.0,
      title: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1920),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(sizeProvider.isDesktop ? "assets/slogan.png" : "assets/icon.png", height: 30),
              const LanguageDropdownWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
