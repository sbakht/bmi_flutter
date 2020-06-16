import 'dart:math';

class Calculator {
  final double height;
  final int weight;
  double _bmi;

  Calculator({this.height, this.weight}) {
    calculateBMI();
  }

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Try losing some weight.";
    } else if (_bmi > 18.5) {
      return "Your pretty good";
    } else {
      return "Gain some weight.";
    }
  }
}
