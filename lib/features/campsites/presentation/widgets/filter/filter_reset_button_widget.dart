import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../dependency_injection.dart';

class FilterResetButtonWidget extends ConsumerStatefulWidget {
  const FilterResetButtonWidget({super.key});

  @override
  ConsumerState<FilterResetButtonWidget> createState() => _CampCardWidgetState();
}

class _CampCardWidgetState extends ConsumerState<FilterResetButtonWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final campsiteNotifier = ref.watch(campsiteNotifierProvider.notifier);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            campsiteNotifier.resetFilters();
          },
          icon: const Icon(Icons.refresh),
          label: const Text("Reset Filters"),
        ),
      ),
    );
  }
}
