part of 'components.dart';

class DynamicBlurredBox extends StatelessWidget {
  const DynamicBlurredBox({
    super.key,
    required this.widget,
  });

  final DepositPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.3,
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: ContainerText(
              title: "Minimal deposit: 0.001 BTC",
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            child: SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              child: ContainerText(
                title:
                    "If a deposit is below the required minimum, the funds will not be credited to your account",
                fontSize: 12,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 70,
              width: SizeConfig.screenWidth * 0.6,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const ContainerText(
                title: 'Continue',
              ),
            ),
          ),
          if (!widget.needSpace)
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 3, sigmaY: 3, tileMode: TileMode.mirror),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: SizeConfig.screenHeight * 0.28,
                  ),
                ))
        ],
      ),
    );
  }
}
