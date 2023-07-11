import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constant.dart';
import 'package:bmi_app/components/reusablecard.dart';
import 'package:bmi_app/components/weightandgebutton.dart';
import 'package:bmi_app/components/columcard.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/calculator_brain.dart';
import 'resultpage.dart';

enum EnumGender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  EnumGender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = EnumGender.male;
                        });
                      },
                      customColors: selectedGender == EnumGender.male
                          ? kActiveCustomColor
                          : kInactiveCustomColor,
                      cardChild: const ColumnCard(
                        cardIcon: kCardIconMale,
                        cardText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = EnumGender.female;
                        });
                      },
                      customColors: selectedGender == EnumGender.female
                          ? kActiveCustomColor
                          : kInactiveCustomColor,
                      cardChild: const ColumnCard(
                        cardIcon: kCardIconFemale,
                        cardText: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //the middle container
            Expanded(
              child: ReusableCard(
                customColors: kActiveCustomColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: kTextLabel),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kNumberLabel),
                        const Text('CM', style: kTextLabel),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveColor,
                        thumbColor: kThumbColor,
                        thumbShape: kRoundSilderThumb,
                        overlayColor: kOverlayColor,
                        overlayShape: kRoundSliderOverlay,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            //second row at the bottom
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      customColors: kActiveCustomColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kTextLabel,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumberLabel,
                              ),
                              const Text(
                                'KG',
                                style: kTextLabel,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                weightOncheck: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                weightIcons: FontAwesomeIcons.minus,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                weightOncheck: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                weightIcons: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kTextLabel,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberLabel,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundAgeIcon(
                                  ageIcon: FontAwesomeIcons.minus,
                                  ageOncheck: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundAgeIcon(
                                  ageIcon: FontAwesomeIcons.plus,
                                  ageOncheck: () {
                                    age++;
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        customColors: kActiveCustomColor),
                  ),
                ],
              ),
            ),

            ReusableButton(
              onPressed: () {
                CalculatorBrain cals =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ResultPage(
                  bmi: cals.calculatorBMI(),
                  textResult: cals.getResult(),
                  interpretation: cals.getInterpretation(),
                )),);
              },
              textButton: 'Calculate',
            )
          ],
        ));
  }
}
