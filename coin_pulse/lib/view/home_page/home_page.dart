import 'package:coin_pulse/config/res/assets/app_images.dart';
import 'package:coin_pulse/widgets/glowing_icon.dart';
import 'package:coin_pulse/widgets/glowing_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/blurred_gradient_overlay.dart';
import 'components/cc_exchange_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double triCircularSpacing = 10;
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(
        children: [
          const Positioned(
            top: -100,
            right: -100,
            child: BlurredGradientOverlay(color: Color(0xff0A3C47)),
          ),
          const Positioned(
            bottom: -100,
            left: -100,
            child: BlurredGradientOverlay(color: Color(0xff326045)),
          ),
          const Positioned(
            bottom: 0,
            top: -200,
            left: 0,
            right: 0,
            child: BlurredGradientOverlay(
              color: Color(0xff211F09),
              height: 100,
              width: 100,
              sigmaXY: 220,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CCExchangeRow(
                    ccIcon: const Icon(
                      CupertinoIcons.bitcoin,
                      size: 34,
                      color: Color(0xffFFDD48),
                    ),
                    fromCcName: "SOL",
                    ccContainerColor: const Color(0xff21200B),
                    currencyRateFromTxt: "1",
                    currencyRateToTxt: '35,394',
                    exchangeRateTxt: '567',
                    outerContainerColor: const Color(0xff315E65),
                    outerOutlineColors: [
                      Colors.transparent,
                      Colors.lightBlue.withOpacity(.4),
                      Colors.blueGrey.withOpacity(0.1),
                      Colors.blueAccent.withOpacity(0.1)
                    ],
                    innerContainerColor: const Color(0xff153439),
                    isFromExchange: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const GlowingIcon(
                      glowColor: Color(0xff91DC9C),
                      child: Icon(
                        CupertinoIcons.arrow_swap,
                        size: 30,
                        shadows: [
                          Shadow(
                            color: Color(0xff91DC9C),
                            blurRadius: 40.0,
                          ),
                        ],
                        color: Color(
                          0xff91DC9C,
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  CCExchangeRow(
                    ccIcon: const Icon(
                      CupertinoIcons.money_dollar,
                      size: 34,
                      color: Color(0xff5DBBC8),
                    ),
                    toCcName: "ADA",
                    ccContainerColor: const Color(0xff0B2223),
                    exchangeRateTxt: '20 069',
                    outerContainerColor: const Color(0xff665107),
                    outerOutlineColors: [
                      Colors.transparent,
                      Colors.amberAccent.withOpacity(.4),
                      Colors.amberAccent.withOpacity(0.1),
                      Colors.amber.withOpacity(0.1)
                    ],
                    isFromExchange: false,
                    toCurrencyRate: '40,717.68',
                    innerContainerColor: const Color(0xff292412),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  transactionRow(),
                  const SizedBox(
                    height: 30,
                  ),
                  triCircularNavButton(
                      triCircularSpacing: triCircularSpacing,
                      navBtnIcons: [
                        Icons.account_balance_wallet_rounded,
                        CupertinoIcons.flame_fill
                      ],
                      navBtnTxt: [
                        "Change",
                        "Deposit"
                      ]),
                  triCircularNavButton(
                      rotateDown: true,
                      triCircularSpacing: triCircularSpacing,
                      navBtnIcons: [
                        Icons.shopping_cart_rounded,
                        Icons.widgets_sharp
                      ],
                      navBtnTxt: [
                        "Orders",
                        "Withdraw"
                      ]),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: -400,
            left: 0,
            right: -100,
            child: Image.asset(
              AppImages.greenEclipse,
            ),
          ),
        ],
      ),
    );
  }

  Row triCircularNavButton(
      {bool rotateDown = false,
      required double triCircularSpacing,
      required List<IconData> navBtnIcons,
      required List<String> navBtnTxt}) {
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

  Row transactionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction cost:",
              style: TextStyle(color: Colors.white54),
            ),
            Text(
              "~\$7.87",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        Container(
          alignment: Alignment.center,
          height: 55,
          width: 150,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(26)),
            gradient: LinearGradient(
              colors: [Color(0xffF6DE2B), Color(0xFFC0E96A)],
            ),
          ),
          child: const Text(
            "Swap",
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}

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
