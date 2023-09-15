part of 'components.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedGradientContainer(
      childAlignment: Alignment.centerLeft,
      outerContainerColor: kOrangeGradientOuterContainerColor,
      outerOutlineColors: kOrangeGradientOuterLineColors,
      innerContainerColor: kOrangeGradientInnerContainerColor,
      height: 160,
      width: double.infinity,
      isTransform6: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildPaymentMethodRow(
              iconPath: AppIcons.cryptoCurrency,
              label: "Cryptocurrency",
              endIconPath: AppIcons.tickCircle),
          Padding(
            padding: const EdgeInsets.only(left: 45.0),
            child: Container(
              height: 0.3,
              color: Colors.white24,
            ),
          ),
          buildPaymentMethodRow(
              iconPath: AppIcons.card, label: "Debit or Credit card"),
        ],
      ),
    );
  }

  Row buildPaymentMethodRow({
    required String iconPath,
    String? endIconPath = "",
    required String label,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GlowingIcon(
                glowColor: Colors.white,
                child: SvgPicture.asset(
                  iconPath,
                  height: 25,
                  colorFilter:
                      ColorFilter.mode(kSecondaryIconColor, BlendMode.srcIn),
                )),
            const SizedBox(
              width: 20,
            ),
            GlowingTextWidget(
              text: label,
            ),
          ],
        ),
        if (endIconPath!.isNotEmpty)
          SvgPicture.asset(
            endIconPath,
            height: 25,
            colorFilter: ColorFilter.mode(kSecondaryIconColor, BlendMode.srcIn),
          )
      ],
    );
  }
}
