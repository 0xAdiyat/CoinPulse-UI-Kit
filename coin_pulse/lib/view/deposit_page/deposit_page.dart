import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

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
      print('Yo');
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientAppBar(title: depositTitle),
            buildSpacingBox(),
            const GradientTitleContainer(
              title: walletTitle,
              innerText: btcAmount,
              downText: bitcoin,
            ),
            buildSpacingBox(),
            const ContainerTitle(title: paymentMethodTitle),
            const PaymentMethods(),
            buildSpacingBox(),
            const GradientTitleContainer(
              title: addressTitle,
              innerText: bitcoinAddress,
              downText: "",
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSpacingBox() {
    return const SizedBox(
      height: spacingBoxHeight,
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
const spacingBoxHeight = 40.0;
