import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:coin_pulse/widgets/glowing_icon.dart';
import 'package:coin_pulse/widgets/glowing_text_widget.dart';
import 'package:coin_pulse/widgets/outlined_gradient_container.dart';
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
          OutlinedGradientContainer(
              childAlignment: Alignment.center,
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
              child: const Text(
                "Deposit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
          const Text(
            "Wallet",
            style: TextStyle(fontSize: 18),
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
                  FloatingActionButton(
                    backgroundColor: Colors.white10,
                    onPressed: () {},
                    child: const Icon(
                      Icons.ac_unit_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
