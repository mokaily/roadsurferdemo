import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/filter_params.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FiltersScreen> {
  late bool closeToWater;
  late bool campfires;
  late Set<String> selectedLanguages;

  @override
  void initState() {
    final filter = ref.read(campsiteNotifierProvider.notifier).filterParams;
    closeToWater = filter.isCloseToWater ?? false;
    campfires = filter.isCampFireAllowed ?? false;
    selectedLanguages = {...?filter.hostLanguages};
    super.initState();
  }

  RangeValues? _localRange;

  @override
  Widget build(BuildContext context) {
    final campsiteNotifier = ref.read(campsiteNotifierProvider.notifier);

    final currentFilter = campsiteNotifier.filterParams;

    final double minLimit = campsiteNotifier.filterParams.lowestMinPricePerNight ?? 0;
    final double maxLimit = campsiteNotifier.filterParams.highestPricePerNight ?? 1000;

    final priceRange = _localRange ??
        RangeValues(
          currentFilter.minPricePerNight ?? minLimit,
          currentFilter.maxPricePerNight ?? maxLimit,
        );

    return SizedBox.expand(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Features",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  RangeSlider(
                    values: priceRange,
                    onChanged: (range) {
                      setState(() => _localRange = range);
                    },
                    onChangeEnd: (range) {
                      campsiteNotifier.applyFilter(
                        currentFilter.copyWith(
                          minPricePerNight: range.start,
                          maxPricePerNight: range.end,
                        ),
                      );
                    },
                    min: minLimit,
                    max: maxLimit,
                    divisions: 20,
                    labels: RangeLabels(
                      "${priceRange.start.toInt()}€",
                      "${priceRange.end.toInt()}€",
                    ),
                  ),
                  DropdownButtonFormField<CampsiteSortBy>(
                    value: currentFilter.sortBy,
                    decoration: const InputDecoration(
                      labelText: "Sort by",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: CampsiteSortBy.lowestPrice,
                        child: Text("Lowest Price"),
                      ),
                      DropdownMenuItem(
                        value: CampsiteSortBy.highestPrice,
                        child: Text("Highest Price"),
                      ),
                      DropdownMenuItem(
                        value: CampsiteSortBy.older,
                        child: Text("Older"),
                      ),
                      DropdownMenuItem(
                        value: CampsiteSortBy.newer,
                        child: Text("Newer"),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(campsiteNotifierProvider.notifier).applyFilter(
                              currentFilter.copyWith(sortBy: value),
                            );
                      }
                    },
                  ),
                  _buildCheckbox("Close to Water", closeToWater, (val) => closeToWater = val ?? false),
                  _buildCheckbox("Campfires", campfires, (val) => campfires = val ?? false),
                  const SizedBox(height: 20),
                  const Text("Languages", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Wrap(
                    spacing: 8,
                    children: [
                      _buildLanguageChip("en", "English"),
                      _buildLanguageChip("de", "German"),
                    ],
                  ),
                  const SizedBox(height: 100), // padding so content doesn't hide under button
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh),
                label: const Text("Reset Filters"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _apply() {
    ref.read(campsiteNotifierProvider.notifier).applyFilter(
          FilterParams(
            isCloseToWater: closeToWater,
            isCampFireAllowed: campfires,
            hostLanguages: selectedLanguages.toList(),
          ),
        );
  }

  Widget _buildCheckbox(String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: (val) {
        setState(() => onChanged(val));
        _apply();
      },
    );
  }

  Widget _buildLanguageChip(String langCode, String label) {
    final isSelected = selectedLanguages.contains(langCode);
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            selectedLanguages.add(langCode);
          } else {
            selectedLanguages.remove(langCode);
          }
          _apply();
        });
      },
    );
  }
}
