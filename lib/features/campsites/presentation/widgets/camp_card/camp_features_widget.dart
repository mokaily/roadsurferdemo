import 'package:flutter/material.dart';

class CampFeaturesWidget extends StatelessWidget {
  final String feature;
  final String iconPath;

  const CampFeaturesWidget({super.key, required this.feature, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 5),
        Text(feature)
      ],
    );
  }
}
