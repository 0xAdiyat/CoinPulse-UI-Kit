part of 'components.dart';

class GradientTitleContainer extends StatelessWidget {
  final String title, innerText, downText;

  const GradientTitleContainer({
    super.key,
    required this.title,
    required this.innerText,
    required this.downText,
  });

  @override
  Widget build(BuildContext context) {
    bool isWallet = title.contains("Wallet");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerTitle(title: title),
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
                  if (isWallet)
                    GlowingIcon(
                        glowColor: Colors.white,
                        child: SvgPicture.asset(
                          AppIcons.btcCc,
                          height: 30,
                        )),
                  if (isWallet)
                    const SizedBox(
                      width: 20,
                    ),
                  isWallet
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
              isWallet
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
