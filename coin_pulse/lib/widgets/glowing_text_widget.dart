import 'package:flutter/material.dart';

class GlowingTextWidget extends StatelessWidget {
  final String text;
  final Color? glowColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight fontWeight;

  const GlowingTextWidget({
    super.key,
    required this.text,
    this.glowColor,
    this.textColor,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: glowColor ?? Colors.white,
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight,
          color: textColor ?? Colors.white,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: glowColor ?? Colors.white,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 100),
        child: Text(
          text,
        ),
      ),
    );
  }
}
