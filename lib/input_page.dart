import 'package:flutter/material.dart';
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
                        Text(height.toString(), style: KHeightLabel),
                        Text('CM', style: KTextLabel),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor:Color(0xFF8D8E98) ,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 11.0),
                        overlayColor: Color(0x1FEB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25),
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
                children: const [
                  Expanded(
                    child: ReusableCard(customColors: KActiveCustomColor),
                  ),
                  Expanded(
                    child: ReusableCard(customColors: KActiveCustomColor),
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
