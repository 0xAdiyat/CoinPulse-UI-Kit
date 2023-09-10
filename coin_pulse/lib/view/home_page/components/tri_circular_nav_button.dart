import 'package:flutter/material.dart';

import 'triangle_container.dart';

class TriCircularNavButton extends StatelessWidget {
  const TriCircularNavButton(
      {super.key,
      required this.triCircularSpacing,
      required this.navBtnIcons,
      required this.navBtnTxt,
      required this.triNavIndex,
      this.isUpperRow = true,
      required this.selectedIndex,
      required this.onIndexChanged});

  final double triCircularSpacing;
  final List<String> navBtnTxt, navBtnIcons;

  final List<int> triNavIndex;

  final bool isUpperRow;

  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onIndexChanged(isUpperRow ? 1 : 3);
          },
          child: TriangleContainer(
            spacing: triCircularSpacing,
            navBtnIcon: isUpperRow ? navBtnIcons[1] : navBtnIcons[3],
            navBtnText: isUpperRow ? navBtnTxt[1] : navBtnTxt[3],
            selectedIndex: selectedIndex,
            currentIndex: isUpperRow ? triNavIndex[1] : triNavIndex[3],
          ),
        ),
        SizedBox(
          width: triCircularSpacing,
        ),
        GestureDetector(
          onTap: () {
            onIndexChanged(isUpperRow ? 0 : 2);
          },
          child: TriangleContainer(
            spacing: triCircularSpacing,
            navBtnIcon: isUpperRow ? navBtnIcons[0] : navBtnIcons[2],
            navBtnText: isUpperRow ? navBtnTxt[0] : navBtnTxt[2],
            selectedIndex: selectedIndex,
            currentIndex: isUpperRow ? triNavIndex[0] : triNavIndex[2],
          ),
        ),
      ],
    );
  }
}
