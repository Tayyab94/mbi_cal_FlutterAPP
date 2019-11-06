import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:mbi_cal/Input_Icon_Content.dart';

import 'package:mbi_cal/Components/Input_Icon_Content.dart';
import 'package:mbi_cal/Components/Reusable_Cart_Content.dart';
import 'package:mbi_cal/Constants.dart';
import 'Result_Page.dart';
import 'package:mbi_cal/Components/Round_Icon_Button.dart';
import 'package:mbi_cal/Components/Button_Bottom.dart';
import 'package:mbi_cal/MBI_Brain.dart';

enum Gender {
  male,
  female,
}

class Input_page extends StatefulWidget {
  @override
  _Input_pageState createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
//  Color maleColor = inActiveColor;
//  Color femaleColor = inActiveColor;
//  void UpdateColor(Gender Selectedgen) {
//    if (Selectedgen == Gender.male) {
//      if (maleColor == inActiveColor) {
//        maleColor = activeCartColor;
//        femaleColor = inActiveColor;
//      } else {
//        maleColor = inActiveColor;
//      }
//    }
//
//    if (Selectedgen == Gender.female) {
//      if (femaleColor == inActiveColor) {
//        femaleColor = activeCartColor;
//        maleColor = inActiveColor;
//      } else {
//        femaleColor = inActiveColor;
//      }
//    }
//  }

  Gender SelectedGentder;
  int height = 180;
  int weight = 55;
  int age = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Body Mass Cal')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCart(
                    onPress: () {
                      setState(() {
                        SelectedGentder = Gender.male;
                      });
                    },
                    rang: SelectedGentder == Gender.male
                        ? kActiveCartColor
                        : kInActiveColor,
                    childCart: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCart(
                    onPress: () {
                      setState(() {
                        //      UpdateColor(Gender.female);  // We use Gender Enum
                        SelectedGentder = Gender.female;
                      });
                    },
                    rang: SelectedGentder == Gender.female
                        ? kActiveCartColor
                        : kInActiveColor,
                    childCart: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCart(
              rang: kActiveCartColor,
              childCart: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hight',
                    style: kLableStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberStyle),
                      Text(
                        'cm',
                        style: kLableStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8D98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.9),
                      overlayColor: Color(0x29EB1555),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 1.0,
                      max: 220.0,
                      onChanged: (double val) {
                        setState(() {
                          height = val.round();
                        });
                      },
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
                  child: ReusableCart(
                    rang: kActiveCartColor,
                    childCart: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLableStyle,
                        ),
                        Text(weight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 1.7,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCart(
                    rang: kActiveCartColor,
                    childCart: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLableStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            btnText: 'Result',
            onpress: () {
              BMIBrain cal = BMIBrain(height: height, weight: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: cal.getResult(),
                    resultText: cal.calculateBmi(),
                    ResultSuggestion: cal.Get_interpretation(),

                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
