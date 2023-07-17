import 'package:bmi_calculator/calculateBMI.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/reusable_card.dart';
import 'components/bottonButton.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.interpretation,required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: getcardstyle(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        bmiResult,
                        style: kBmiTextStyle,
                      ),
                      Text(textAlign: TextAlign.center,
                          interpretation,
                          style: kBodyTextStyle,

                      )
                    ],
                  )),
            ),
            bottonButton(onTap: () {

              Navigator.pop(context); }, buttonTitle: 'RECALCULATE',),
          ],
        ));
  }
}

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
