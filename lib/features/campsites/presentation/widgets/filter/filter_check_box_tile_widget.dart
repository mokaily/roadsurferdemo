import 'package:flutter/material.dart';
import 'package:roadsurferdemo/core/themes/themes.dart';

class FilterCheckboxTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const FilterCheckboxTile({super.key, required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Themes(baseContext: context);

    return CheckboxListTile(
      title: Text(title, style: theme.setTheme().textTheme.bodyMedium),
      value: value,
      onChanged: onChanged,
    );
  }
}
