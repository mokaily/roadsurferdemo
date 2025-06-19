import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_price_range_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_reset_button_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_sort_by_widget.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
import 'filter_features_widget.dart';
import 'filter_language_widget.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FiltersScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Themes(baseContext: context);

    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                AppLocalizations.of(context)!.f_filters,
                style: theme.setTheme().textTheme.displayMedium,
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ScrollConfiguration(
                behavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
                ),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  dragStartBehavior: DragStartBehavior.start,
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      FilterPriceRangeWidget(),
                      SizedBox(height: 20),
                      FilterSortByWidget(),
                      SizedBox(height: 20),
                      FilterFeaturesWidget(),
                      SizedBox(height: 20),
                      FilterLanguagesWidget(),
                    ],
                  ),
                ),
              ),
            ),
            const FilterResetButtonWidget(),
          ],
        ),
      ),
    );
  }
}
