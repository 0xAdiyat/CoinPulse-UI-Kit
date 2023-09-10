import 'package:coin_pulse/view/exchange_page/components/cc_rate_details.dart';
import 'package:flutter/material.dart';

import '../../../widgets/outlined_gradient_container.dart';

class CCExchangeRow extends StatelessWidget {
  const CCExchangeRow({
    super.key,
    required this.ccIcon,
    this.fromCcName,
    required this.ccContainerColor,
    this.currencyRateFromTxt,
    this.currencyRateToTxt,
    required this.exchangeRateTxt,
    required this.outerContainerColor,
    required this.outerOutlineColors,
    required this.isFromExchange,
    this.toCurrencyRate,
    this.toCcName,
    required this.innerContainerColor,
  });

  final Widget ccIcon;
  final String? fromCcName, toCcName;
  final Color ccContainerColor;
  final String? currencyRateFromTxt, currencyRateToTxt, toCurrencyRate;
  final Color outerContainerColor, innerContainerColor;
  final List<Color> outerOutlineColors;
  final String exchangeRateTxt;
  final bool isFromExchange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cCIconNameRow(),
        OutlinedGradientContainer(
          outerContainerColor: outerContainerColor,
          outerOutlineColors: outerOutlineColors,
          innerContainerColor: innerContainerColor,
          isTransform6: true,
          child: CCRateDetails(
            fromCcName: fromCcName ?? "",
            toCcName: toCcName ?? "",
            currencyRateFromTxt: currencyRateFromTxt,
            currencyRateToTxt: currencyRateToTxt,
            exchangeRateTxt: exchangeRateTxt,
            toCurrencyRate: toCurrencyRate,
            isFromExchange: isFromExchange,
          ),
        ),
      ],
    );
  }

  Row cCIconNameRow() {
    return Row(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: ccContainerColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(onPressed: () {}, icon: ccIcon),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          fromCcName ?? toCcName!,
          textAlign: TextAlign.end,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        )
      ],
    );
  }
}
