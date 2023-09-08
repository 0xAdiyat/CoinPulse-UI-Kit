import 'package:flutter/material.dart';

class GlowingIcon extends StatelessWidget {
  final Widget child;
  final Color glowColor;

  const GlowingIcon({
    super.key,
    required this.child,
    required this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: glowColor,
      child: child,
    );
  }
}
