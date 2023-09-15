part of 'components.dart';

class TriCircularNavBar extends StatefulWidget {
  final ValueChanged<int> currentSelectedNavButton;

  const TriCircularNavBar({
    super.key,
    required this.currentSelectedNavButton,
  });

  @override
  State<TriCircularNavBar> createState() => _TriCircularNavBarState();
}

class _TriCircularNavBarState extends State<TriCircularNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double extraVerticalSpacing = selectedIndex == 1 ? 20 : 0;
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
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TriCircularNavButton(
            triCircularSpacing: kTriCircularSpacing,
            navBtnIcons: navBtnIcons,
            navBtnTxt: navBtnTitles,
            triNavIndex: navBtnIndex,
            extraVerticalSpacing: extraVerticalSpacing,
            selectedIndex: selectedIndex,
            onIndexChanged: (int newIndex) {
              setState(() {
                selectedIndex = newIndex;
                widget.currentSelectedNavButton(selectedIndex);
              });
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: TriCircularNavButton(
            triCircularSpacing: kTriCircularSpacing,
            navBtnIcons: navBtnIcons,
            navBtnTxt: navBtnTitles,
            triNavIndex: navBtnIndex,
            extraVerticalSpacing: extraVerticalSpacing,
            isUpperRow: false,
            selectedIndex: selectedIndex,
            onIndexChanged: (int newIndex) {
              setState(() {
                selectedIndex = newIndex;
                widget.currentSelectedNavButton(selectedIndex);
              });
            },
          ),
        ),
      ],
    );
  }
}
