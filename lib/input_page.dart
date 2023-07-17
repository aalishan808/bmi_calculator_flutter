import 'components/icon_content.dart';
import 'components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resultPage.dart';
import 'components/bottonButton.dart';
import 'calculateBMI.dart';
enum gender { male, female, c }

gender selectedGender = gender.c;

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 80;
  int Age = 20;
  Color malecardcolor = kInactiveCardColor;
  Color femalecardcolor = kInactiveCardColor;
// void updateColor(gender sgender){
//   if(sgender==gender.male){
//     if(malecardcolor==inactiveCardColor){
//       malecardcolor = activecardcolor;
//       femalecardcolor = inactiveCardColor;
//     }
//     else{
//       malecardcolor = inactiveCardColor;
//     }
//   }
//
//   else{
//     if(gender==gender.female){
//       if(femalecardcolor==inactiveCardColor){
//         femalecardcolor = activecardcolor;
//         malecardcolor = inactiveCardColor;
//       }
//       else{
//         femalecardcolor = inactiveCardColor;
//       }
//     }
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  child: reusable_card(
                      onPress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      },
                      color_: selectedGender == gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardchild: icon_context(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      )),
                ),
                Expanded(
                  child: reusable_card(
                    onPress: () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                    color_: selectedGender == gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardchild: icon_context(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
                child: getcardstyle(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 260.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ))),
            Expanded(
              child: Row(children: [
                Expanded(
                    child: getcardstyle(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Weight",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))),
                Expanded(
                    child: getcardstyle(
                        kActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              Age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      Age++;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width:10,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      Age--;
                                    });
                                  },
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))),
              ]),
            ),
            bottonButton(onTap: () {
              calculateBMI cal = calculateBMI( weight:weight,  height:height);

              Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(
                bmiResult: cal.calculateBmi(),
              resultText: cal.getResult(),
                interpretation:cal.getInterpretation(),))); }, buttonTitle: 'CALCULATE',)
          ],
        ));
  }
}

//style
Widget getcardstyle(Color color_, Widget cardChild) {
  return Container(
    child: cardChild,
    margin: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: color_,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
