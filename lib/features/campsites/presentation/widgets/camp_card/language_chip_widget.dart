import 'package:flutter/material.dart';

import '../../../../../core/themes/themes.dart';
import '../../../../../core/utils/constants.dart';

class LanguageChipsWidget extends StatelessWidget {
  final List<String> hostLanguages;

  const LanguageChipsWidget({super.key, required this.hostLanguages});

  @override
  Widget build(BuildContext context) {
    final theme = Themes(baseContext: context);
    Locale currentLocale = Localizations.localeOf(context);

    Map<String, String> languagesLabel = (currentLocale.languageCode == 'en'
        ? Constants.languageLabelsEnglish
        : Constants.languageLabelsGerman);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hostLanguages.where((langCode) => languagesLabel.containsKey(langCode)).map((langCode) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            color: theme.setTheme().primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            languagesLabel[langCode]!,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}
