import 'file:///Users/anuradhawijethunga/AndroidStudioProjects/bmi_calculator_supermydroid/lib/computerBrain.dart';
import 'package:bmicalculatorsupermydroid/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'enums/GenderType.dart';
import 'Constants.dart';
import 'ReusableCard.dart';
import 'ReusableCardWidget.dart';

class BmiCal extends StatefulWidget {
  @override
  _BmiCalState createState() => _BmiCalState();
}

class _BmiCalState extends State<BmiCal> {
  GenderType gender;
  int sliderValue = 180;
  int weight = 60;
  int age = 30;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(kAppName),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = GenderType.MALE;
                        });
                      },
                      childCard: ReusableCardWidget(
                        cardIcon: Image.asset("images/male.png"),
                        cardText: "MALE",
                      ),
                      color: gender == GenderType.MALE
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = GenderType.FEMALE;
                        });
                      },
                      childCard: ReusableCardWidget(
                        cardIcon: Image.asset("images/female.png"),
                        cardText: "FEMALE",
                      ),
                      color: gender == GenderType.FEMALE
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: labelText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          sliderValue.toString(),
                          style: numbersStyle,
                        ),
                        Text("cm"),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: Colors.pink,
                          overlayColor: Color(0x16C2185B),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                      child: Slider(
                        value: sliderValue.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            sliderValue = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                color: inactiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: labelText,
                          ),
                          Text(
                            weight.toString(),
                            style: numbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Icon(
                                    FontAwesomeIcons.minusCircle,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Icon(
                                    FontAwesomeIcons.plusCircle,
                                    size: 40.0,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      color: inactiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: inactiveCardColor,
                      childCard: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: labelText,
                          ),
                          Text(
                            age.toString(),
                            style: numbersStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Icon(
                                    FontAwesomeIcons.minusCircle,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Icon(
                                    FontAwesomeIcons.plusCircle,
                                    size: 40.0,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Calculate cal = Calculate(height: sliderValue, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results(
                      score: cal.getBMIValue(),
                      interpretation: cal.getInterpretation(),
                      resultLevel: cal.getBMILevel(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "CALCULATE",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                color: bottomContainerColor,
                width: double.infinity,
                height: bottomContainerHeight,
                margin: EdgeInsets.only(top: 10.0),
              ),
            ),
          ],
        ));
  }
}
