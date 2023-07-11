import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';


// for  weight-icon-button
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.weightIcons, required this.weightOncheck});

  final VoidCallback? weightOncheck;
  final IconData? weightIcons;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightOncheck,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kIconButtonColor,
      child: Icon(weightIcons),
    );
  }
}

// for age-icon-button

class RoundAgeIcon extends StatelessWidget {
  const RoundAgeIcon({super.key, required this.ageIcon,required this.ageOncheck });

  final IconData? ageIcon;
  final VoidCallback? ageOncheck;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ageOncheck,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kIconButtonColor,
      child: Icon(ageIcon),
    );
  }
}