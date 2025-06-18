import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_price_range_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_reset_button_widget.dart';
import 'package:roadsurferdemo/features/campsites/presentation/widgets/filter/filter_sort_by_widget.dart';
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
    return const SizedBox.expand(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Filters",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
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
          FilterResetButtonWidget(),
        ],
      ),
    );
  }
}
