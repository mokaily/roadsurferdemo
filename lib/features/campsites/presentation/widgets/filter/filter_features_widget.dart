import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
import '../../../../../dependency_injection.dart';
import 'filter_check_box_tile_widget.dart';

class FilterFeaturesWidget extends ConsumerStatefulWidget {
  const FilterFeaturesWidget({super.key});

  @override
  ConsumerState<FilterFeaturesWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterFeaturesWidget> {
  bool closeToWater = false;
  bool campfires = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final filter = ref.read(campsiteNotifierProvider.notifier).filterParams;
      closeToWater = filter.isCloseToWater ?? false;
      campfires = filter.isCampFireAllowed ?? false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Themes(baseContext: context);
    final campsiteNotifier = ref.watch(campsiteNotifierProvider.notifier);
    FilterParams currentFilter = ref.watch(currentFilterProvider);

    ref.listen(campsiteNotifierProvider.select((value) => value), ((previous, next) async {
      if (next is FilterInitiating) {
        setState(() {
          currentFilter = next.filterParams;
          closeToWater = currentFilter.isCloseToWater ?? false;
          campfires = currentFilter.isCampFireAllowed ?? false;
        });
      }
    }));

    void _apply() {
      final updated = ref.watch(currentFilterProvider).copyWith(isCloseToWater: closeToWater, isCampFireAllowed: campfires);
      campsiteNotifier.applyFilter(updated);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.f_features,
          style: theme.setTheme().textTheme.bodySmall,
        ),
        FilterCheckboxTile(
          onChanged: (value) => setState(() {
            closeToWater = value ?? false;
            _apply();
          }),
          title: AppLocalizations.of(context)!.f_close_to_water,
          value: closeToWater,
        ),
        FilterCheckboxTile(
          onChanged: (value) => setState(() {
            campfires = value ?? false;
            _apply();
          }),
          title: AppLocalizations.of(context)!.f_camp_fires_allowed,
          value: campfires,
        ),
        const SizedBox(height: 10),
        const Divider(height: 1),
      ],
    );
  }
}
