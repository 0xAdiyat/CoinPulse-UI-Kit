part of 'components.dart';

class ContainerText extends StatelessWidget {
  final String title;
  final Color? color;
  final double fontSize;

  const ContainerText(
      {super.key,
      required this.title,
      this.color = Colors.white,
      this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize, color: color),
      ),
    );
  }
}
