import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredGradientOverlay extends StatelessWidget {
  const BlurredGradientOverlay({
    super.key,
    required this.color, this.sigmaXY, this.height, this.width,
  });

  final Color color;
  final double? sigmaXY;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 320,
        width: width ?? 210,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: sigmaXY ?? 150, sigmaY: sigmaXY ?? 150),
          child: Container(
            height: height ?? 320,
            width: width ?? 210,
            color: Colors.transparent,
          ),
        ));
  }
}
