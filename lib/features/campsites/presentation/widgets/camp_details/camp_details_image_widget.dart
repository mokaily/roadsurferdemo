import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';

class CampDetailsImageWidget extends ConsumerWidget {
  final CampsiteParams? campsite;

  const CampDetailsImageWidget({super.key, required this.campsite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Themes(baseContext: context);

    return Container(
      height: 350,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          campsite!.photo,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 350,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/icon.png',
              fit: BoxFit.contain,
              alignment: Alignment.center,
            );
          },
        ),
      ),
    );
  }
}
