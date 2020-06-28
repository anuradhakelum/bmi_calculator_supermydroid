import 'package:flutter/material.dart';
import 'Constants.dart';

class ReusableCardWidget extends StatelessWidget {
  final Image cardIcon;
  final String cardText;

  ReusableCardWidget({@required this.cardIcon, @required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 80.0,
          width: 80.0,
          child: cardIcon,
        ),
//        Icon(
//          cardIcon,
//          size: 80.0,
//        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: labelText,
        ),
      ],
    );
  }
}
