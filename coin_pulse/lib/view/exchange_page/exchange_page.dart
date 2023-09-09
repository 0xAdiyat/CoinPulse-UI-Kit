import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/res/assets/app_icons.dart';
import '../../widgets/glowing_icon.dart';
import '../home_page/components/tri_circular_nav_button.dart';
import 'components/cc_exchange_row.dart';
import 'components/transaction_swap_row.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double triCircularSpacing = 10;
    var fromCCIconWidget = SvgPicture.asset(
      AppIcons.bnbCC,
      height: 30,
      fit: BoxFit.cover,
    );
    var toCCIconWidget = SvgPicture.asset(
      AppIcons.xtzCC,
      height: 28,
      fit: BoxFit.cover,
    );
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CCExchangeRow(
              ccIcon: fromCCIconWidget,
              fromCcName: "BNB",
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
              ccIcon: toCCIconWidget,
              toCcName: "XTZ",
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
            TransactionSwapRow(),
            const SizedBox(
              height: 40,
            ),
            TriCircularNavButton(
                triCircularSpacing: triCircularSpacing,
                navBtnIcons: [
                  Icons.account_balance_wallet_rounded,
                  CupertinoIcons.flame_fill
                ],
                navBtnTxt: [
                  "Change",
                  "Deposit"
                ]),
            TriCircularNavButton(
                rotateDown: true,
                triCircularSpacing: triCircularSpacing,
                navBtnIcons: [Icons.shopping_cart_rounded, Icons.widgets_sharp],
                navBtnTxt: ["Orders", "Withdraw"]),
          ],
        ),
      ),
    );
  }
}
