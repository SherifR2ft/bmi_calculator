import 'dart:ui';
import '../components/k_constants.dart';
import 'package:flutter/material.dart';
import '../components/modified_container.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
          child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,

            child: Text(
              ' Your Result',
              style: kTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: ModifiedCountainer(
              color: kActiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(

                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    bmiResult,
                    style: kNumberTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
                  Text(interpretation, style: kLabelTextStyle,
                    textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          BottomButton(
              label: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      )),
    );
  }
}
