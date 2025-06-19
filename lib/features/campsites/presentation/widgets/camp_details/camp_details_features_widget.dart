import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/core/utils/constants.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';

class CampDetailsFeaturesWidget extends ConsumerWidget {
  final CampsiteParams? campsite;

  const CampDetailsFeaturesWidget({super.key, required this.campsite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);

    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(height: 1),
            const SizedBox(height: 24),
            Text("Features", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
                          SizedBox(height: 8),
                          Text(
                            "Campfires Allowed",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
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
                          SizedBox(height: 8),
                          Text("Close to Water", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                  ...["en", "de"].where((langCode) => Constants.languageLabels.containsKey(langCode)).map((
                    langCode,
                  ) {
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
                                Constants.languageLabels[langCode]!.substring(0, 2).toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${Constants.languageLabels[langCode]} Supported",
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
                          child: Center(
                            child: Icon(Icons.star_border_purple500_outlined, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Highly Rated", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Divider(height: 1),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
