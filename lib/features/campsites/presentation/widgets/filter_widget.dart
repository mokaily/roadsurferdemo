import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../dependency_injection.dart';
import '../../domain/entities/filter_params.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campsiteState = ref.watch(campsiteNotifierProvider);
    final campsiteNotifier = ref.read(campsiteNotifierProvider.notifier);

    return Container(
      margin: EdgeInsets.all(20),
      color: Colors.grey[200],
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: List.generate(50, (index) => ListTile(title: Text("Filter option $index"))),
      ),
    );
  }
}
