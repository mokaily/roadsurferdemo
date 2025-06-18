import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import '../../../../../dependency_injection.dart';

class FilterPriceRangeWidget extends ConsumerStatefulWidget {
  const FilterPriceRangeWidget({super.key});

  @override
  ConsumerState<FilterPriceRangeWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterPriceRangeWidget> {
  @override
  void initState() {
    super.initState();
  }

  RangeValues? _localRange;

  @override
  Widget build(BuildContext context) {
    final campsiteNotifier = ref.watch(campsiteNotifierProvider.notifier);
    FilterParams currentFilter = ref.watch(currentFilterProvider);
    double? minLimit = currentFilter.lowestMinPricePerNight;
    double? maxLimit = currentFilter.highestPricePerNight;

    RangeValues priceRange = _localRange ??
        RangeValues(
          currentFilter.minPricePerNight ?? minLimit ?? 0,
          currentFilter.maxPricePerNight ?? maxLimit ?? 1000,
        );

    ref.listen(campsiteNotifierProvider.select((value) => value), ((previous, next) async {
      if (next is FilterInitiating) {
        setState(() {
          currentFilter = next.filterParams;
          minLimit = currentFilter.lowestMinPricePerNight;
          maxLimit = currentFilter.highestPricePerNight;
          priceRange = RangeValues(minLimit ?? 0, maxLimit ?? 1000);
          _localRange = RangeValues(minLimit ?? 0, maxLimit ?? 1000);
        });
      }
    }));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Price Range",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        RangeSlider(
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
          values: priceRange,
          onChanged: (range) {
            setState(() => _localRange = range);
          },
          onChangeEnd: (range) {
            final updated = ref.watch(currentFilterProvider).copyWith(
              minPricePerNight: range.start,
              maxPricePerNight: range.end,
            );
            campsiteNotifier.applyFilter(updated);
          },
          min: minLimit ?? 0,
          max: maxLimit ?? 1000,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("€${priceRange.start.toStringAsFixed(2)}"),
              Text("€${priceRange.end.toStringAsFixed(2)}"),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(height: 1),
      ],
    );
  }
}
