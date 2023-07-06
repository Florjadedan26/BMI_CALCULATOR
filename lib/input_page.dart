import 'package:flutter/material.dart';
import 'class.dart';
import 'const.dart';

enum EnumGender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  EnumGender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = EnumGender.male;
                        });

                      },
                      customColors: selectedGender == EnumGender.male
                          ? activeCustomColor
                          : inactiveCustomColor,
                      carChild: ColumnCard(
                        cardIcon: cardIconMale,
                        cardText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = EnumGender.female;
                        });
                      },
                      customColors: selectedGender == EnumGender.female
                          ? activeCustomColor
                          : inactiveCustomColor,
                      carChild: ColumnCard(
                        cardIcon: cardIconeFemale,
                        cardText: "FEMALE",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //the middle container
            const Expanded(
              child: ReusableCard(customColors: activeCustomColor),
            ),

            //second row at the bottom
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: ReusableCard(customColors: activeCustomColor),
                  ),
                  Expanded(
                    child: ReusableCard(customColors: activeCustomColor),
                  ),
                ],
              ),
            ),

            Container(
              color: bottomCustomColor,
              margin: const EdgeInsets.only(top: 15),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
