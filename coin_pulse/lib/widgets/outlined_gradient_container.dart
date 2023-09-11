import 'dart:math' as math;

import 'package:coin_pulse/widgets/custom_outline.dart';
import 'package:flutter/material.dart';

class OutlinedGradientContainer extends StatelessWidget {
  const OutlinedGradientContainer({
    super.key,
    required this.outerContainerColor,
    required this.outerOutlineColors,
    required this.innerContainerColor,
    required this.child,
    required this.isTransform6,
    this.height,
    this.width,
    this.childAlignment,
  });

  final Color outerContainerColor, innerContainerColor;
  final List<Color> outerOutlineColors;
  final Widget child;
  final bool isTransform6;
  final double? height, width;
  final Alignment? childAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 123,
      width: width ?? 203,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            transform: GradientRotation(isTransform6 ? 6 : 9),
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.transparent,
              outerContainerColor.withOpacity(0.3),
            ],
            stops: const [
              0.6,
              0.9
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomOutline(
          strokeWidth: 3,
          radius: 26,
          padding: const EdgeInsets.all(0),
          width: 0,
          height: 0,
          gradient: LinearGradient(
              transform: GradientRotation(isTransform6 ? 6 : 9),
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: outerOutlineColors,
              stops: const [.2, .6, .8, .1]),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: childAlignment ?? Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  transform: const GradientRotation(math.pi / 4),
                  colors: [
                    Colors.transparent,
                    innerContainerColor.withOpacity(0.7)
                  ]),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
