import 'package:flutter/material.dart';
import 'package:text_transformation_animation/text_transformation_animation.dart';

import '../../../config/themes/app_colors.dart';

class TransactionSwapRow extends StatefulWidget {
  const TransactionSwapRow({super.key});

  @override
  State<TransactionSwapRow> createState() => _TransactionSwapRowState();
}

class _TransactionSwapRowState extends State<TransactionSwapRow> {
  String _costTxt = "~\$7.87";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Transaction cost:",
              style: TextStyle(color: Colors.white54),
            ),
            TextTransformationAnimation(
              text: _costTxt,
              style: const TextStyle(fontSize: 24),
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
        InkWell(
          onTap: () => setState(
            () => _costTxt = "~\$0.00",
          ),
          child: Container(
            alignment: Alignment.center,
            height: 55,
            width: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              gradient: LinearGradient(colors: kGradientButtonColor),
            ),
            child: const Text(
              "Swap",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
