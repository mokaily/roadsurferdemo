import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/utils/extensions.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';

class CampDetailsWidget extends ConsumerWidget {
  final CampsiteParams? campsite;
  final GeoCodingParams? campAddress;

  const CampDetailsWidget({super.key, required this.campsite, required this.campAddress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                if (campAddress?.city != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "${campAddress?.city ?? ""}, ${campAddress?.country}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text("per night", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
