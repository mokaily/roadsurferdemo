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
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode(skipTraversal: true, canRequestFocus: false);

  @override
  void initState() {
    super.initState();
    final locale = ref.read(localeProvider);
    _controller = TextEditingController(text: locale.languageCode);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    if (_controller.text != locale.languageCode) {
      _controller.text = locale.languageCode.toUpperCase();
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: DropdownMenu<String>(
        controller: _controller,
        focusNode: _focusNode,
        enabled: true,
        width: 80,
        initialSelection: locale.languageCode,
        enableSearch: false,
        enableFilter: false,
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
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),
        dropdownMenuEntries: Constants.kSupportedLanguages.entries.map((entry) {
          return DropdownMenuEntry<String>(
            value: entry.key,
            label: entry.value,
            labelWidget: Text(
              entry.value,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}
