import 'package:bmi_calculator/Calculator.dart';
import 'package:bmi_calculator/MyCard.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Calculator calc = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Result"),
      ),
      body: Column(children: [
        Expanded(
          child: MyCard(
            active: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text(calc.getResult(), style: kLabelStyle)),
                Center(
                  child: Text(
                    calc.calculateBMI(),
                    style: kNumberStyle.copyWith(fontSize: 80),
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Text(calc.getInterpretation())),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            color: kSubmitButtonColor,
            height: 70,
            child: Center(
              child: Text("RE-CALCULATE"),
            ),
            width: double.infinity,
          ),
        ),
      ]),
    );
  }
}
