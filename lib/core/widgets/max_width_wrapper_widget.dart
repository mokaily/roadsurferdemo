import 'package:flutter/material.dart';

class MaxWidthWrapper extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const MaxWidthWrapper({
    super.key,
    required this.child,
    this.maxWidth = 1920,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
