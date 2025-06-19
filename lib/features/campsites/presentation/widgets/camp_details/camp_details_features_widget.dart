import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/core/utils/constants.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';

class CampDetailsFeaturesWidget extends ConsumerWidget {
  final CampsiteParams? campsite;

  const CampDetailsFeaturesWidget({super.key, required this.campsite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);
    Locale currentLocale = Localizations.localeOf(context);

    Map<String, String> languagesLabel = (currentLocale.languageCode == 'en'
        ? Constants.languageLabelsEnglish
        : Constants.languageLabelsGerman);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(height: 1),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.f_features,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 20,
              spacing: 20,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                if (campsite!.isCampFireAllowed)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset("assets/fire.png", width: 48),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.f_camp_fires_allowed,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                if (campsite!.isCloseToWater)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset("assets/water.png", width: 48),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.f_close_to_water,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ...["en", "de"].where((langCode) => languagesLabel.containsKey(langCode)).map((langCode) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: theme.setTheme().primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              languagesLabel[langCode]!.substring(0, 2).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${languagesLabel[langCode]} ${AppLocalizations.of(context)!.d_supported}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  );
                }),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.setTheme().primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Center(
                          child: Icon(Icons.star_border_purple500_outlined, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(AppLocalizations.of(context)!.d_highly_rated, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(height: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
