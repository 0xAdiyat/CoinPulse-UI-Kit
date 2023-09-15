part of 'components.dart';

class GradientAppBar extends StatelessWidget {
  final String title;

  const GradientAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedGradientContainer(
      childAlignment: Alignment.center,
      outerContainerColor: kBlueGradientOuterContainerColor,
      outerOutlineColors: kTransparentGradientOuterLineColors,
      innerContainerColor: kBlueGradientInnerContainerColor,
      height: 120,
      width: double.infinity,
      isTransform6: true,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
