import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'class.dart';
import 'constant.dart';

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
                          ? KActiveCustomColor
                          : KInactiveCustomColor,
                      cardChild: ColumnCard(
                        cardIcon: KCardIconMale,
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
                          ? KActiveCustomColor
                          : KInactiveCustomColor,
                      cardChild: ColumnCard(
                        cardIcon: KCardIconeFemale,
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
                customColors: KActiveCustomColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: KTextLabel),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: KNumberLabel),
                        Text('CM', style: KTextLabel),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: KInactiveColor,
                        thumbColor: KThumbColor,
                        thumbShape: KRoundSilderThumb,
                        overlayColor: KOverlayColor,
                        overlayShape: KRoundSliderOverlay,
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
                      customColors: KActiveCustomColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: KTextLabel,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: KNumberLabel,
                              ),
                              Text(
                                'KG',
                                style: KTextLabel,
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
                              SizedBox(
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
                            Text('AGE', style: KTextLabel,),
                            Text(age.toString(), style: KNumberLabel,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  RoundAgeIcon(ageIcon: FontAwesomeIcons.minus,
                                    ageOncheck: (){
                                    setState(() {
                                      age--;
                                    });
                                    },
                                  ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundAgeIcon(ageIcon: FontAwesomeIcons.plus,
                                  ageOncheck: (){
                                  age ++ ;
                                  },
                                ),


                              ],
                            )
                          ],

                        ), customColors: KActiveCustomColor),
                  ),
                ],
              ),
            ),

            Container(
              color: KBottomCustomColor,
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              height: KBottomContainerHeight,
            )
          ],
        ));
  }
}



