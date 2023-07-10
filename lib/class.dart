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

// for  weight-icon-button
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.weightIcons, required this.weightOncheck});

  final VoidCallback? weightOncheck;
  final IconData? weightIcons;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightOncheck,
      child: Icon(weightIcons),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: KIconButtonColor,
    );
  }
}

// for age-icon-button

class RoundAgeIcon extends StatelessWidget {
  const RoundAgeIcon({required this.ageIcon,required this.ageOncheck });

  final IconData? ageIcon;
  final VoidCallback? ageOncheck;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ageOncheck,
      elevation: 6.0,
      child: Icon(ageIcon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: KIconButtonColor,
    );
  }
}
