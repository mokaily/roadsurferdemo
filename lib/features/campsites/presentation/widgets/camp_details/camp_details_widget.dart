import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/core/utils/extensions.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/l10n/app_localizations.dart';

class CampDetailsWidget extends ConsumerWidget {
  final CampsiteParams? campsite;
  final GeoCodingParams? campAddress;

  const CampDetailsWidget({super.key, required this.campsite, required this.campAddress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  campsite!.label.capitalCase(),
                  style: theme.setTheme().textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                if (campAddress?.city != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "${campAddress?.city ?? ""}, ${campAddress?.country}",
                      style: theme.setTheme().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "€ ${campsite?.pricePerNight.toStringAsFixed(2)}",
                style: theme.setTheme().textTheme.labelLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  AppLocalizations.of(context)!.d_per_night,
                  style: theme.setTheme().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
