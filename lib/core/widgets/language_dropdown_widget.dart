import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/local_provider.dart';
import '../utils/constants.dart';

class LanguageDropdownWidget extends ConsumerStatefulWidget {
  const LanguageDropdownWidget({super.key});

  @override
  ConsumerState<LanguageDropdownWidget> createState() => _LanguageDropdownWidgetState();
}

class _LanguageDropdownWidgetState extends ConsumerState<LanguageDropdownWidget> {

  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: DropdownMenu<String>(
        enabled: true,
        width: 80,
        initialSelection: locale.languageCode,
        onSelected: (value) {
          if (value != null) {
            ref.read(localeProvider.notifier).state = Locale(value);
          }
        },
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          decoration: _isHovering ? TextDecoration.underline : TextDecoration.none,
        ),
        dropdownMenuEntries: Constants.kSupportedLanguages.entries.map((entry) {
          return DropdownMenuEntry<String>(
            value: entry.key,
            labelWidget:  Text(
              entry.value,
              style: const TextStyle(color: Colors.white),
            ), label: entry.value,
          );
        }).toList(),
      ),
    );
  }
}
