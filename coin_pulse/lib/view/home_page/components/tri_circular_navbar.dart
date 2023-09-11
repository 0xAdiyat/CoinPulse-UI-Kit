import 'package:coin_pulse/config/res/assets/app_icons.dart';
import 'package:coin_pulse/view/home_page/components/tri_circular_nav_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_const.dart';

class TriCircularNavBar extends StatefulWidget {
  final ValueChanged<int> currentSelectedNavButton;

  const TriCircularNavBar({super.key, required this.currentSelectedNavButton});

  @override
  State<TriCircularNavBar> createState() => _TriCircularNavBarState();
}

class _TriCircularNavBarState extends State<TriCircularNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> navBtnTitles = [
      "Change",
      "Deposit",
      "Withdraw",
      "Orders"
    ];
    final List<int> navBtnIndex = [0, 1, 2, 3];
    final List<String> navBtnIcons = [
      AppIcons.exchangeNav,
      AppIcons.depositNav,
      AppIcons.withdrawNav,
      AppIcons.ordersNav,
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TriCircularNavButton(
          triCircularSpacing: triCircularSpacing,
          navBtnIcons: navBtnIcons,
          navBtnTxt: navBtnTitles,
          triNavIndex: navBtnIndex,
          selectedIndex: selectedIndex,
          onIndexChanged: (int newIndex) {
            setState(() {
              selectedIndex = newIndex;
              widget.currentSelectedNavButton(selectedIndex);
            });
          },
        ),
        TriCircularNavButton(
          triCircularSpacing: triCircularSpacing,
          navBtnIcons: navBtnIcons,
          navBtnTxt: navBtnTitles,
          triNavIndex: navBtnIndex,
          isUpperRow: false,
          selectedIndex: selectedIndex,
          onIndexChanged: (int newIndex) {
            setState(() {
              selectedIndex = newIndex;
              widget.currentSelectedNavButton(selectedIndex);
            });
          },
        ),
      ],
    );
  }
}
