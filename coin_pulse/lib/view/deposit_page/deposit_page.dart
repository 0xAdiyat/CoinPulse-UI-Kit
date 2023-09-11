import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:coin_pulse/widgets/glowing_icon.dart';
import 'package:coin_pulse/widgets/glowing_text_widget.dart';
import 'package:coin_pulse/widgets/outlined_gradient_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OutlinedGradientContainer(
            childAlignment: Alignment.center,
            outerContainerColor: kBlueGradientOuterContainerColor,
            outerOutlineColors: kTransparentGradientOuterLineColors,
            innerContainerColor: kBlueGradientInnerContainerColor,
            height: 120,
            width: double.infinity,
            isTransform6: true,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Deposit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Wallet",
              style: TextStyle(fontSize: 18),
            ),
          ),
          OutlinedGradientContainer(
              childAlignment: Alignment.centerLeft,
              outerContainerColor: const Color(0xff315E65),
              outerOutlineColors: [
                Colors.transparent,
                Colors.lightBlue.withOpacity(.4),
                Colors.blueGrey.withOpacity(0.1),
                Colors.blueAccent.withOpacity(0.1)
              ],
              innerContainerColor: const Color(0xff153439),
              height: 100,
              width: double.infinity,
              isTransform6: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlowingIcon(
                          glowColor: Colors.white,
                          child: SvgPicture.asset(
                            AppIcons.btnCC,
                            height: 16,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlowingTextWidget(
                            text: "0.53219593 BTC",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GlowingTextWidget(
                            text: "BitCoin",
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 25,
                    alignment: Alignment.center,
                    width: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white10),
                    child: Icon(
                      Icons.arrow_right_rounded,
                      size: 25,
                      color: const Color(0xffB3BDE0).withOpacity(0.3),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Payment Method",
              style: TextStyle(fontSize: 18),
            ),
          ),
          OutlinedGradientContainer(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GlowingIcon(
                            glowColor: Colors.white,
                            child: SvgPicture.asset(
                              AppIcons.btnCC,
                              height: 16,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        const GlowingTextWidget(
                          text: "Cryptocurrency",
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      alignment: Alignment.center,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white10),
                      child: Icon(
                        Icons.arrow_right_rounded,
                        size: 25,
                        color: const Color(0xffB3BDE0).withOpacity(0.3),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45.0),
                  child: Container(
                    height: 0.3,
                    color: Colors.white24,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GlowingIcon(
                            glowColor: Colors.white,
                            child: SvgPicture.asset(
                              AppIcons.btnCC,
                              height: 16,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        const GlowingTextWidget(
                          text: "Debit or Credit card",
                        ),
                      ],
                    ),
                    Container(
                      height: 25,
                      alignment: Alignment.center,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white10),
                      child: Icon(
                        Icons.arrow_right_rounded,
                        size: 25,
                        color: const Color(0xffB3BDE0).withOpacity(0.3),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Address",
              style: TextStyle(fontSize: 18),
            ),
          ),
          OutlinedGradientContainer(
              childAlignment: Alignment.centerLeft,
              outerContainerColor: const Color(0xff315E65),
              outerOutlineColors: [
                Colors.transparent,
                Colors.lightBlue.withOpacity(.4),
                Colors.blueGrey.withOpacity(0.1),
                Colors.blueAccent.withOpacity(0.1)
              ],
              innerContainerColor: const Color(0xff153439),
              height: 100,
              width: double.infinity,
              isTransform6: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GlowingIcon(
                          glowColor: Colors.white,
                          child: SvgPicture.asset(
                            AppIcons.btnCC,
                            height: 16,
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .55,
                        child: const GlowingTextWidget(
                          text: "1Gx9FCknxSsLfFDzFdn75Xgqx95sDp38ir",
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.doc_on_clipboard,
                    size: 25,
                    color: const Color(0xffB3BDE0).withOpacity(0.3),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
