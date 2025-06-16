import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';

class LanguageChipsWidget extends StatelessWidget {
  final List<String> hostLanguages;

  const LanguageChipsWidget({super.key, required this.hostLanguages});


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: hostLanguages
          .where((langCode) => Constants.languageLabels.containsKey(langCode))
          .map((langCode) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            Constants.languageLabels[langCode]!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }
}
