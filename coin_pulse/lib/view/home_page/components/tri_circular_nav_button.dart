import 'package:flutter/material.dart';

import '../../../components/triangle_container.dart';

class TriCircularNavButton extends StatelessWidget {
  const TriCircularNavButton(
      {super.key,
      required this.triCircularSpacing,
      required this.navBtnIcons,
      required this.navBtnTxt,
      this.rotateDown = false});

  final bool rotateDown;
  final double triCircularSpacing;
  final List<IconData> navBtnIcons;
  final List<String> navBtnTxt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TriangleContainer(
          isSelectedNav: false,
          rotateLeft: !rotateDown,
          rotateDownLeft: rotateDown,
          spacing: triCircularSpacing,
          navBtnIcon: navBtnIcons[1],
          navBtnText: navBtnTxt[1],
        ),
        SizedBox(
          width: triCircularSpacing,
        ),
        TriangleContainer(
          isSelectedNav: rotateDown ? false : true,
          rotateDown: rotateDown,
          spacing: triCircularSpacing,
          navBtnIcon: navBtnIcons[0],
          navBtnText: navBtnTxt[0],
        ),
      ],
    );
  }
}
