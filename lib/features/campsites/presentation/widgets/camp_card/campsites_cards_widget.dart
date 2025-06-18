import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'camp_card_widget.dart';

class CampGridViewWidget extends ConsumerWidget {
  final List<CampsiteParams> campsite;
  const CampGridViewWidget({super.key, required this.campsite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 350,
          mainAxisExtent: 320,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CampCardWidget(campsite: campsite[index]);
          },
          childCount: campsite.length,
        ),
      ),
    );
  }
}
