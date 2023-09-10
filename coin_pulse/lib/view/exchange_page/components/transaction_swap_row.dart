import 'package:flutter/material.dart';

class TransactionSwapRow extends StatelessWidget {
  const TransactionSwapRow({super.key});

  @override
  Widget build(BuildContext context) {
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