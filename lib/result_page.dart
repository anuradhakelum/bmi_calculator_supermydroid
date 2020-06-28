import 'Constants.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.score,
      @required this.resultLevel,
      @required this.interpretation});

  final String score;
  final String resultLevel;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppName),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              "YOUR RESULTS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              childCard: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultLevel,
                      style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      score,
                      style: TextStyle(
                        fontSize: 120.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Normal body mass index value should be between"
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text("18.5 - 25 kg/m2")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Center(
                        child: Text(
                          interpretation.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "RE-CALCULATE",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                color: bottomContainerColor,
                width: double.infinity,
                height: bottomContainerHeight,
                margin: EdgeInsets.only(top: 10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
