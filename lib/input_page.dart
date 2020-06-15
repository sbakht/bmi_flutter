import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GenderCard.dart';
import 'MyCard.dart';

const submitButtonColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var activeGender = 0;

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
                          child: GestureDetector(
                            onTap: () {
                              setState(activateMale);
                            },
                            child: MyCard(
                              active: isMaleActive(),
                              child: GenderCard(
                                  icon: FontAwesomeIcons.mars, text: "MALE"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(activateFemale);
                            },
                            child: MyCard(
                              active: isFemaleActive(),
                              child: GenderCard(
                                  icon: FontAwesomeIcons.venus, text: "FEMALE"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: MyCard(active: true)),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child: MyCard(active: true)),
                        Expanded(child: MyCard(active: true)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: submitButtonColor,
            height: 70,
            child: Center(
              child: Text("CALCULATE"),
            ),
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  void activateFemale() {
    activeGender = 2;
  }

  void activateMale() {
    activeGender = 1;
  }

  bool isFemaleActive() => activeGender == 2;

  bool isMaleActive() => activeGender == 1;
}
