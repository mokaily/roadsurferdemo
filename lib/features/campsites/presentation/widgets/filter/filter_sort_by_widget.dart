import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
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
        Text(
          AppLocalizations.of(context)!.f_sort_by,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        RadioListTile<CampsiteSortBy>(
          title: Text(AppLocalizations.of(context)!.f_lowest_price),
          value: CampsiteSortBy.lowestPrice,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.lowestPrice),
        ),
        RadioListTile<CampsiteSortBy>(
          title: Text(AppLocalizations.of(context)!.f_highest_price),
          value: CampsiteSortBy.highestPrice,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.highestPrice),
        ),
        RadioListTile<CampsiteSortBy>(
          title: Text(AppLocalizations.of(context)!.f_older),
          value: CampsiteSortBy.older,
          groupValue: currentFilter.sortBy,
          controlAffinity: ListTileControlAffinity.trailing,
          onChanged: (value) => toggleSortBy(CampsiteSortBy.older),
        ),
        RadioListTile<CampsiteSortBy>(
          title: Text(AppLocalizations.of(context)!.f_newer),
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
