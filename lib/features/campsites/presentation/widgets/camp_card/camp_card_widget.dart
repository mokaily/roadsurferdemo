import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/features/campsites/presentation/pages/campsite_details_page.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';
import '../../../domain/entities/campsite_params.dart';
import 'language_chip_widget.dart';
import 'package:roadsurferdemo/core/utils/extensions.dart';

import 'camp_features_widget.dart';

class CampCardWidget extends ConsumerStatefulWidget {
  final CampsiteParams? campsite;

  const CampCardWidget({super.key, required this.campsite});

  @override
  ConsumerState<CampCardWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<CampCardWidget> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Themes(baseContext: context);
    final String photoAddress = '${widget.campsite!.photo}?lock=${widget.campsite!.id}';

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CampsiteDetails(campsite: widget.campsite),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: _isHover ? 0.5 : 0.3),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      photoAddress,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/icon.png',
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                          width: 220,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "€",
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.campsite?.pricePerNight.toStringAsFixed(2),
                              style: theme.setTheme().textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: AppLocalizations.of(context)!.g_night.toLowerCase()),
                          ],
                        ),
                      ),
                      Text(
                        widget.campsite!.label.capitalCase(),
                        maxLines: 1,
                        style: theme.setTheme().textTheme.displayMedium,
                      ),
                      const SizedBox(height: 5),
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: SizedBox(
                          height: 55,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (widget.campsite!.isCloseToWater)
                                CampFeaturesWidget(
                                  feature: AppLocalizations.of(context)!.f_close_to_water,
                                  iconPath: 'assets/water.png',
                                ),
                              if (widget.campsite!.isCampFireAllowed)
                                CampFeaturesWidget(
                                  feature: AppLocalizations.of(context)!.f_camp_fires_allowed,
                                  iconPath: 'assets/fire.png',
                                ),
                            ],
                          ),
                        ),
                      ),
                      LanguageChipsWidget(hostLanguages: widget.campsite!.hostLanguages),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
