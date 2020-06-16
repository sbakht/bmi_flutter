import 'package:bmi_calculator/Calculator.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GenderCard.dart';
import 'MyCard.dart';

enum MGender { Nothing, Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var activeGender = MGender.Nothing; // 0, 1, 2
  var height = 150.0;
  var weight = 110;
  var age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: MyCard(
                            active: isMaleActive(),
                            child: buildMaleCard(),
                            onTap: () => setState(activateMale),
                          ),
                        ),
                        Expanded(
                          child: MyCard(
                            active: isFemaleActive(),
                            child: buildFemaleCard(),
                            onTap: () => setState(activateFemale),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      active: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("HEIGHT", style: kLabelStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(height.toInt().toString(),
                                  style: kNumberStyle),
                              Text("cm", style: kLabelStyle),
                            ],
                          ),
                          Slider(
                            min: 120,
                            max: 220,
                            value: height,
                            onChanged: (val) {
                              setState(() {
                                height = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Incrementor(
                            text: "WEIGHT",
                            weight: weight,
                            inc: () {
                              setState(() {
                                weight++;
                              });
                            },
                            dec: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Incrementor(
                            text: "AGE",
                            weight: age,
                            inc: () {
                              setState(() {
                                age++;
                              });
                            },
                            dec: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = new Calculator(height: height, weight: weight);
              Navigator.pushNamed(context, '/results', arguments: calc);
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              color: kSubmitButtonColor,
              height: 70,
              child: Center(
                child: Text("CALCULATE"),
              ),
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  GenderCard buildFemaleCard() {
    return GenderCard(icon: FontAwesomeIcons.venus, text: "FEMALE");
  }

  GenderCard buildMaleCard() {
    return GenderCard(icon: FontAwesomeIcons.mars, text: "MALE");
  }

  void activateFemale() {
    activeGender = MGender.Female;
  }

  void activateMale() {
    activeGender = MGender.Male;
  }

  bool isFemaleActive() => activeGender == MGender.Female;

  bool isMaleActive() => activeGender == MGender.Male;
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}

class Incrementor extends StatelessWidget {
  final int weight;
  final String text;
  final Function inc;
  final Function dec;
  Incrementor({this.text, this.weight, this.inc, this.dec});

  @override
  Widget build(BuildContext context) {
    return MyCard(
        active: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: kLabelStyle),
            Text(weight.toString(), style: kNumberStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPress: this.dec,
                ),
                SizedBox(width: 20),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPress: this.inc,
                ),
              ],
            ),
          ],
        ));
  }
}
