import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/notifiers/screen_size_notifier.dart';
import 'package:roadsurferdemo/core/providers/screen_size_provider.dart';
import 'filter_widget.dart';

class FilterMobileWidget extends ConsumerStatefulWidget {
  const FilterMobileWidget({super.key});

  @override
  ConsumerState<FilterMobileWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterMobileWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizeNotifier sizeProvider = ref.watch(screenSizeProvider);

    if (sizeProvider.isDesktop) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
    }

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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: const FiltersScreen(),
          ),
        ),
      ],
    );
  }
}
