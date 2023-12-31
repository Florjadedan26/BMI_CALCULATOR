import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';


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
          style: kTextLabel,
        ),
      ],
    );
  }
}