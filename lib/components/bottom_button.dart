import 'package:flutter/material.dart';
import 'package:bmi_app/constant.dart';


class ReusableButton extends StatelessWidget {
  const ReusableButton ({super.key, required this.onPressed , required this.textButton});

  final VoidCallback onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomCustomColor,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(textButton,
            style: kBottomTextLabel,
          ),
        ),
      ),
    );
  }
}