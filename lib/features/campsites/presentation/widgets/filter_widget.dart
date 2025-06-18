import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/filter_params.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsiteState = ref.watch(campsiteNotifierProvider);
    final campsiteNotifier = ref.read(campsiteNotifierProvider.notifier);
    //
    // final filter = campsiteState.filterParams;
    //
    // RangeValues currentRange = RangeValues(
    //   campsiteState.filterParams.minPricePerNight ?? 0,
    //   campsiteState.filterParams.maxPricePerNight ?? 1000,
    // );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Filters",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // RangeSlider(values: RangeValues(0, 1000), onChanged: (rangeValues) {
          //   campsiteNotifier.updateFilterParams(
          //     FilterParams(priceRange: rangeValues),
          //   );
          // }, min: 0, max: 1000, divisions: 10, labels: RangeLabels("0", "1000")),


          // CheckboxListTile(
          //   title: const Text("Show only available campsites"),
          //   value: campsiteState.filterParams.showAvailableOnly,
          //   onChanged: (value) {
          //     campsiteNotifier.updateFilterParams(
          //       FilterParams(showAvailableOnly: value ?? false),
          //     );
          //   },
          // ),
          // CheckboxListTile(
          //   title: const Text("Show campsites with amenities"),
          //   value: campsiteState.filterParams.showWithAmenities,
          //   onChanged: (value) {
          //     campsiteNotifier.updateFilterParams(
          //       FilterParams(showWithAmenities: value ?? false),
          //     );
          //   },
          // ),
          CheckboxListTile(
            title: const Text("Show campsites with reviews"),
            value: true,
            onChanged: (value) {
              // campsiteNotifier.updateFilterParams(
              //   FilterParams(showWithReviews: value ?? false),
              // );
            },
          ),
          // Add more filter options as needed
        ],
      ),
    );
  }
}
