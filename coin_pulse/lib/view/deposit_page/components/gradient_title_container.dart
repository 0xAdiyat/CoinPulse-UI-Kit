part of 'components.dart';

class GradientTitleContainer extends StatelessWidget {
  final String title, innerText, downText;
  final bool enableFirstIcon;

  const GradientTitleContainer({
    super.key,
    required this.title,
    required this.innerText,
    required this.downText,
    this.enableFirstIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerText(title: title),
        OutlinedGradientContainer(
          childAlignment: Alignment.centerLeft,
          outerContainerColor: kBlueGradientOuterContainerColor,
          outerOutlineColors: kBlueGradientOuterLineColors,
          innerContainerColor: kBlueGradientInnerContainerColor,
          height: 100,
          width: double.maxFinite,
          isTransform6: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (enableFirstIcon)
                    Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kDeepOrangeColor,
                      ),
                      child: GlowingIcon(
                          glowColor: Colors.white,
                          child: SvgPicture.asset(
                            AppIcons.btcCc,
                            height: 20,
                          )),
                    ),
                  if (enableFirstIcon)
                    const SizedBox(
                      width: 10,
                    ),
                  enableFirstIcon
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlowingTextWidget(
                              text: innerText,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            GlowingTextWidget(
                              text: downText,
                            ),
                          ],
                        )
                      : SizedBox(
                          width: SizeConfig.screenWidth * .68,
                          child: GlowingTextWidget(
                            text: innerText,
                          ),
                        ),
                ],
              ),
              enableFirstIcon
                  ? Container(
                      height: 25,
                      alignment: Alignment.center,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white10),
                      child: SvgPicture.asset(
                        AppIcons.arrowRight,
                        colorFilter: ColorFilter.mode(
                            kSecondaryIconColor, BlendMode.srcIn),
                        height: 18,
                      ))
                  : SvgPicture.asset(
                      AppIcons.copy,
                      height: 25,
                      colorFilter: ColorFilter.mode(
                          kSecondaryIconColor, BlendMode.srcIn),
                    )
            ],
          ),
        ),
      ],
    );
  }
}
