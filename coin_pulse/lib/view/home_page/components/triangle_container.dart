part of 'components.dart';

class TriangleContainer extends StatelessWidget {
  const TriangleContainer({
    super.key,
    required this.spacing,
    required this.navBtnIcon,
    required this.navBtnText,
    required this.currentIndex,
    required this.selectedIndex,
    this.extraVerticalSpacing,
  });

  final double spacing;
  final String navBtnIcon;
  final int selectedIndex;
  final int currentIndex;
  final String navBtnText;
  final double? extraVerticalSpacing;

  @override
  Widget build(BuildContext context) {
    bool rotateLeft, rotateDown, rotateDownLeft, isSelectedNav;
    rotateLeft = currentIndex == 1;
    rotateDown = currentIndex == 2;
    rotateDownLeft = currentIndex == 3;
    isSelectedNav = currentIndex == selectedIndex;

    final triangleBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(
        rotateLeft
            ? 400
            : rotateDownLeft
                ? 35
                : rotateDown
                    ? 30
                    : 35,
      ),
      topRight: Radius.circular(
        rotateLeft
            ? 35
            : rotateDownLeft
                ? 30
                : rotateDown
                    ? 35
                    : 400,
      ),
      bottomLeft: Radius.circular(
        rotateLeft
            ? 35
            : rotateDownLeft
                ? 400
                : rotateDown
                    ? 35
                    : 30,
      ),
      bottomRight: Radius.circular(
        rotateLeft
            ? 30
            : rotateDownLeft
                ? 35
                : rotateDown
                    ? 400
                    : 35,
      ),
    );

    return AnimatedContainer(
      duration: const Duration(milliseconds: kAnimationDuration),
      height: 150,
      width: 150,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: spacing + extraVerticalSpacing! ?? 0),
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
                  kGreenGradientStart,
                  kGreenGradientMiddle,
                  kGreenGradientEnd,
                  kGreenGradientSecondary,
                  kGreenGradientHighlight,
                ]
              : currentIndex != 0
                  ? [
                      kPrimaryColor,
                      kDarkGreen,
                    ]
                  : [
                      kDarkGreen,
                      kPrimaryColor,
                    ],
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: kAnimationDuration),
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
          color: kPrimaryColor,
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
            SvgPicture.asset(
              navBtnIcon,
              height: 30,
              width: 30,
              colorFilter: ColorFilter.mode(
                  isSelectedNav ? kLightGreen : kDarkGray, BlendMode.srcIn),
            ),
            const SizedBox(
              height: 5,
            ),
            isSelectedNav
                ? GlowingTextWidget(
                    text: navBtnText,
                    glowColor: kGlowingText,
                    textColor: kGlowingTextColor,
                    fontSize: 14)
                : AnimatedDefaultTextStyle(
                    style: const TextStyle(color: kTextDefaultColor),
                    duration: const Duration(milliseconds: kAnimationDuration),
                    child: Text(
                      navBtnText,
                    ),
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
