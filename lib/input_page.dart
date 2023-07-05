import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const newCustomColor = Color(0xFF24263B);
const bottomCustomColor = Color(0xFFEB1555);
const cardIconMale = FontAwesomeIcons.mars;
const cardIconeFemale = FontAwesomeIcons.venus;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(customColors: newCustomColor,
                      carChild: ColumnCard( cardIcon: cardIconMale, cardText: 'MALE',),),
                  ),
                  Expanded(
                    child: ReusableCard(customColors: newCustomColor,
                    carChild: ColumnCard( cardIcon: cardIconeFemale, cardText: "FEMALE",),
                    ),
                  ),
                ],
              ),
            ),

            //the middle container
            Expanded(
              child: ReusableCard(customColors: newCustomColor),
            ),

            //second row at the bottom
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(customColors: newCustomColor),
                  ),
                  Expanded(
                    child: ReusableCard(customColors: newCustomColor),
                  ),
                ],
              ),
            ),

            Container(
              color: bottomCustomColor,
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}

class ColumnCard extends StatelessWidget {
  ColumnCard({required this.cardIcon, required this.cardText});

  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon,
        size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(cardText,
        style: TextStyle(
          fontSize: 20.0,
          color: Color(0xFF8D8E98)
        ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.customColors , this.carChild});

  final Color customColors;
  final Widget? carChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: customColors,
      ),
      child: carChild,
    );
  }
}
