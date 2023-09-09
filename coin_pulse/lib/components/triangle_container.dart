import 'package:flutter/material.dart';

import '../widgets/glowing_text_widget.dart';

class TriangleContainer extends StatelessWidget {
  const TriangleContainer({
    super.key,
    this.rotateLeft = false,
    this.rotateDown = false,
    this.rotateDownLeft = false,
    this.isSelectedNav = false,
    required this.spacing,
    required this.navBtnIcon,
    required this.navBtnText,
  });

  final bool rotateLeft, rotateDown, rotateDownLeft, isSelectedNav;
  final double spacing;
  final IconData navBtnIcon;
  final String navBtnText;

  @override
  Widget build(BuildContext context) {
    final triangleBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(rotateLeft
          ? 400
          : rotateDownLeft
              ? 35
              : rotateDown
                  ? 30
                  : 35),
      topRight: Radius.circular(rotateLeft
          ? 35
          : rotateDownLeft
              ? 30
              : rotateDown
                  ? 35
                  : 400),
      bottomLeft: Radius.circular(rotateLeft
          ? 35
          : rotateDownLeft
              ? 400
              : rotateDown
                  ? 35
                  : 30),
      bottomRight: Radius.circular(rotateLeft
          ? 30
          : rotateDownLeft
              ? 35
              : rotateDown
                  ? 400
                  : 35),
    );

    return Container(
      height: 150,
      width: 150,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: spacing),
      decoration: BoxDecoration(
        borderRadius: triangleBorderRadius,
        gradient: LinearGradient(
          begin: isSelectedNav
              ? rotateLeft
                  ? Alignment.topRight
                  : rotateDownLeft
                      ? Alignment.bottomRight
                      : rotateDown
                          ? Alignment.bottomLeft
                          : Alignment.topLeft
              : rotateLeft
                  ? Alignment.topRight
                  : Alignment.bottomLeft,
          end: isSelectedNav
              ? rotateLeft
                  ? Alignment.bottomLeft
                  : rotateDownLeft
                      ? Alignment.bottomLeft
                      : rotateDown
                          ? Alignment.topRight
                          : Alignment.bottomRight
              : rotateLeft
                  ? Alignment.bottomRight
                  : Alignment.topLeft,
          colors: isSelectedNav
              ? [
                  const Color(0xff6DFB8D),
                  const Color(0xff67FF89),
                  const Color(0xffABF5BA),
                  const Color(0xff9CFCB0),
                  const Color(0xff67FE85),
                ]
              : [
                  Colors.black,
                  const Color(0xff3B5F43),
                ],
        ),
      ),
      child: Container(
        height: isSelectedNav ? 125 : 145,
        width: isSelectedNav ? 125 : 145,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: isSelectedNav
              ? [
                  const BoxShadow(
                      color: Color(0xff8AFFA3),
                      blurRadius: 10.0,
                      spreadRadius: 5),
                ]
              : [],
          color: Colors.black,
          borderRadius: triangleBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!rotateDown && !rotateDownLeft)
              const SizedBox(
                height: 20,
              ),
            Icon(
              navBtnIcon,
              size: 30,
              color: isSelectedNav
                  ? const Color(0xffD3FCDD)
                  : const Color(0xff5D7562),
            ),
            const SizedBox(
              height: 5,
            ),
            isSelectedNav
                ? GlowingTextWidget(
                    text: navBtnText,
                    glowColor: Colors.greenAccent,
                    textColor: const Color(0xff7ef39b),
                    fontSize: 14)
                : Text(
                    navBtnText,
                    style: const TextStyle(color: Color(0xff4E5A54)),
                  ),
            if (!rotateLeft && rotateDown || rotateDownLeft)
              const SizedBox(
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}
