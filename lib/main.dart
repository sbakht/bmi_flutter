import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: Color(0xFF0A0E21),
            scaffoldBackgroundColor: Color(0xFF0A0E21),
            cardColor: kCardColor,
            sliderTheme: SliderThemeData(
                activeTrackColor: Colors.yellow,
                inactiveTrackColor: Colors.green,
                overlayColor: Colors.red[200],
                thumbColor: Colors.red,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15))),
        initialRoute: "/",
        routes: {
          "/": (context) => InputPage(),
          "/results": (context) => ResultsPage(),
        });
  }
}
