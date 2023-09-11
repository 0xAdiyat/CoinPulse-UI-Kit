import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/glowing_icon.dart';
import 'components/cc_exchange_row.dart';
import 'components/transaction_swap_row.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CCExchangeRow(
            ccIcon: fromCCIconWidget,
            fromCcName: "BNB",
            ccContainerColor: kDarkBlueColor,
            currencyRateFromTxt: "1",
            currencyRateToTxt: '35,394',
            exchangeRateTxt: '567',
            outerContainerColor: kBlueGradientOuterContainerColor,
            outerOutlineColors: kBlueGradientOuterLineColors,
            innerContainerColor: kBlueGradientInnerContainerColor,
            isFromExchange: true,
          ),
          const SizedBox(
            height: 15,
          ),
          const GlowingIcon(
              glowColor: kGreenGlowColor,
              child: Icon(CupertinoIcons.arrow_swap,
                  size: 30,
                  shadows: [
                    Shadow(
                      color: kGreenGlowColor,
                      blurRadius: 40.0,
                    ),
                  ],
                  color: kGreenGlowColor)),
          const SizedBox(
            height: 15,
          ),
          CCExchangeRow(
            ccIcon: toCCIconWidget,
            toCcName: "XTZ",
            ccContainerColor: kDarkOrangeColor,
            exchangeRateTxt: '20 069',
            ccRateTxtColor: kDarkOrangeTextColor,
            outerContainerColor: kOrangeGradientOuterContainerColor,
            outerOutlineColors: kOrangeGradientOuterLineColors,
            isFromExchange: false,
            toCurrencyRate: '40,717.68',
            innerContainerColor: kOrangeGradientInnerContainerColor,
          ),
          const SizedBox(
            height: 60,
          ),
          const TransactionSwapRow(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
