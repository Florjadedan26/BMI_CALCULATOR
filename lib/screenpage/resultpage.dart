import 'package:flutter/material.dart';
import '../constant.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/reusablecard.dart';


class ResultPage extends StatelessWidget {
  const ResultPage ({super.key,required this.bmi,required this.textResult,required this.interpretation });

  final String bmi;
  final String textResult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       const Expanded(
          child:  Text(
            'Your BMI Result',textAlign: TextAlign.center,
            style: kResultLabel,
          )),
      Expanded(
        flex: 10,
        child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                 Text(
                  textResult,
                  style: kResultTextStyle,
                ),
                Text(
                  bmi,
                  style: kResultBMIStlye,
                ),
                Text(
                  interpretation,
                  textAlign: TextAlign.center,
                  style: kResultBodyStyle,
                ),
              ],
            ),
            customColors: kActiveCustomColor),
      ),
      ReusableButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textButton: 'Re-Calculate')
        ],
      ),
    );
  }
}
