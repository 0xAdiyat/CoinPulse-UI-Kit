import 'package:flutter/material.dart';

class GlowingTextWidget extends StatelessWidget {
  final String text;
  final Color glowColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const GlowingTextWidget({
    super.key,
    required this.text,
    required this.glowColor,
    required this.textColor,
    required this.fontSize,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: glowColor,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: glowColor,
              offset: const Offset(0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
