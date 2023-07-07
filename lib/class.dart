import 'package:bmi_app/constant.dart';
import 'package:flutter/material.dart';

// icon content
class ColumnCard extends StatelessWidget {
  const ColumnCard({super.key, required this.cardIcon, required this.cardText});

  final IconData? cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: KTextLabel,
        ),
      ],
    );
  }
}

//card content
class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.customColors, this.cardChild, this.onPress});

  final Color? customColors;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: customColors,
        ),
        child: cardChild,
      ),
    );
  }
}
