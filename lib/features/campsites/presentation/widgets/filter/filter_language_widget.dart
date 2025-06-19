import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/utils/constants.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
import '../../../../../dependency_injection.dart';
import 'filter_check_box_tile_widget.dart';

class FilterLanguagesWidget extends ConsumerStatefulWidget {
  const FilterLanguagesWidget({super.key});

  @override
  ConsumerState<FilterLanguagesWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterLanguagesWidget> {
  late Set<String> selectedLanguages;

  @override
  void initState() {
    final currentFilter = ref.read(campsiteNotifierProvider.notifier).filterParams;
    selectedLanguages = {...?currentFilter.hostLanguages};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FilterParams currentFilter = ref.watch(currentFilterProvider);
    Locale currentLocale = Localizations.localeOf(context);

    Map<String, String> languagesLabel = (currentLocale.languageCode == 'en'
        ? Constants.languageLabelsEnglish
        : Constants.languageLabelsGerman);

    ref.listen(campsiteNotifierProvider.select((value) => value), ((previous, next) async {
      if (next is FilterInitiating) {
        setState(() {
          currentFilter = next.filterParams;
          selectedLanguages = {...?currentFilter.hostLanguages};
        });
      }
    }));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.f_languages,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...?currentFilter.availableLanguages?.map((lang) {
          return FilterCheckboxTile(
            title: languagesLabel[lang] ?? lang.toUpperCase(),
            value: selectedLanguages.contains(lang),
            onChanged: (val) {
              if (val == true) {
                selectedLanguages.add(lang);
              } else {
                selectedLanguages.remove(lang);
              }

              setState(() {
                final updated = ref
                    .watch(currentFilterProvider)
                    .copyWith(hostLanguages: selectedLanguages.toList());
                ref.read(campsiteNotifierProvider.notifier).applyFilter(updated);
              });
            },
          );
        }),
        const SizedBox(height: 10),
        const Divider(height: 1),
      ],
    );
  }
}
