import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import '../../../../../dependency_injection.dart';

class FilterSortByWidget extends ConsumerStatefulWidget {
  const FilterSortByWidget({super.key});

  @override
  ConsumerState<FilterSortByWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterSortByWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final campsiteNotifier = ref.read(campsiteNotifierProvider.notifier);
    final state = ref.watch(campsiteNotifierProvider);
    final currentFilter = state is FilterInitiating ? state.filterParams : campsiteNotifier.filterParams;


    CampsiteSortBy? selected = currentFilter.sortBy;

    void toggleSortBy(CampsiteSortBy value) {
      final updated = ref.watch(currentFilterProvider).copyWith(
        sortBy: value == selected ? null : value,
      );
      campsiteNotifier.applyFilter(updated);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sort By",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        RadioListTile<CampsiteSortBy>(
          title: const Text("Lowest Price"),
          value: CampsiteSortBy.lowestPrice,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.lowestPrice),
        ),
        RadioListTile<CampsiteSortBy>(
          title: const Text("Highest Price"),
          value: CampsiteSortBy.highestPrice,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.highestPrice),
        ),
        RadioListTile<CampsiteSortBy>(
          title: const Text("Older"),
          value: CampsiteSortBy.older,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.older),
        ),
        RadioListTile<CampsiteSortBy>(
          title: const Text("Newer"),
          value: CampsiteSortBy.newer,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.newer),
        ),
        const SizedBox(height: 10),
        const Divider(height: 1),
      ],
    );
  }
}
