import 'package:animate_do/animate_do.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class DepositPage extends StatefulWidget {
  final bool needSpace;

  final Function(bool) updateNeedSpace;

  const DepositPage(
      {super.key, required this.updateNeedSpace, required this.needSpace});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      setState(() {
        widget.updateNeedSpace(true);
      });
    }
    if (_isTop) {
      setState(() {
        widget.updateNeedSpace(false);
      });
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isTop {
    if (!_scrollController.hasClients) return false;
    final minScroll = _scrollController.position.minScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll <= (minScroll * 0.1);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientAppBar(title: depositTitle),
            buildSpacingBox(),
            FadeInUp(
              child: FadeInDown(
                duration: const Duration(milliseconds: kAnimationDuration),
                child: const GradientTitleContainer(
                  title: walletTitle,
                  innerText: btcAmount,
                  enableFirstIcon: true,
                  downText: bitcoin,
                ),
              ),
            ),
            buildSpacingBox(),
            FadeInUp(
              child: FadeInDown(
                  duration:
                      const Duration(milliseconds: kAnimationDuration + 50),
                  child: const PaymentMethods()),
            ),
            buildSpacingBox(),
            FadeInUp(
              child: FadeInDown(
                duration:
                    const Duration(milliseconds: kAnimationDuration + 100),
                child: const GradientTitleContainer(
                  title: addressTitle,
                  innerText: bitcoinAddress,
                  downText: "",
                ),
              ),
            ),
            buildSpacingBox(),
            DynamicBlurredBox(widget: widget),
          ],
        ),
      ),
    );
  }

  SizedBox buildSpacingBox({double? spacingBoxHeight}) {
    return SizedBox(
      height: spacingBoxHeight ?? 30.0,
    );
  }
}

// String Variables
const depositTitle = "Deposit";
const walletTitle = "Wallet";
const btcAmount = "0.53219593 BTC";
const bitcoin = "BitCoin";
const paymentMethodTitle = "Payment Method";
const addressTitle = "Address";
const bitcoinAddress = "1Gx9FCknxSsLfFDz8irDp38Fdn75Xgqx95sDp38irDp38ir";
