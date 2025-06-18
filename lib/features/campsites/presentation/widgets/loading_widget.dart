import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/widgets/shimmer_loading_widget.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({super.key});

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
            return const ShimmerLoading(
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.grey),
                    )));
          },
          childCount: 15,
        ),
      ),
    );
  }
}
