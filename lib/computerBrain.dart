import 'dart:math';

import 'package:flutter/material.dart';

class Calculate {
  Calculate({@required this.height, @required this.weight});

  final int weight;
  final int height;

  double _bmi;

  String getBMIValue() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMILevel() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "You have a higher weight than the normal body weight";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower weight than the normal body weight";
    }
  }
}
