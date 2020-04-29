import 'dart:ui';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/modified_container.dart';
import '../components/k_constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_button.dart';
import 'package:bmi_calculator/components/bmi_calculator.dart';

//Functions as First Order Objects ,, it muest be out of classes

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color mButtonColor = kInactiveCardColor;
  Color fButtonColor = kInactiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  void activeMaleButton() {
    mButtonColor = kActiveCardColor;
    fButtonColor = kInactiveCardColor;
  }

  void activeFemaleButton() {
    fButtonColor = kActiveCardColor;
    mButtonColor = kInactiveCardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ModifiedCountainer(
                      color: mButtonColor,
                      onTapAction: () {
                        setState(() {
                          activeMaleButton();
                        });
                      },
                      childCard: IconContent(
                        gender: 'male',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ModifiedCountainer(
                      color: fButtonColor,
                      onTapAction: () {
                        setState(() {
                          activeFemaleButton();
                        });
                      },
                      childCard: IconContent(
                        gender: 'female',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ModifiedCountainer(
                color: kActiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Height",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    Flexible(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: kBottomContainerColor,
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ModifiedCountainer(
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    color: kActiveCardColor,
                  )),
                  Expanded(
                    child: ModifiedCountainer(
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Text(
                              'Age',
                              style: kLabelTextStyle,
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      color: kActiveCardColor,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                BMICalculator calc =
                BMICalculator(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
              label: 'Calculate',
            ),
          ],
        )));
  }
}
