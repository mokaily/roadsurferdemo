import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/core/providers/screen_size_provider.dart';
import 'package:roadsurferdemo/core/widgets/max_width_wrapper_widget.dart';

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);

    return Container(
      height: sizeProvider.isDesktop ? 250 : 140,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/banner.jpg"),
          fit: BoxFit.cover,
          alignment: Alignment.center,
          colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.45), BlendMode.darken),
        ),
      ),
      child: MaxWidthWrapper(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Discover amazing campsites",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: sizeProvider.isDesktop ? 45 : 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              if (sizeProvider.isDesktop) ...const [
                SizedBox(height: 8),
                Text(
                  "Discover from wonderful variety of amazing campsites..",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 30),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
