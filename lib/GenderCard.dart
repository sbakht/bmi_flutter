import 'package:flutter/material.dart';

const iconSize = 60.0;
const spaceBetweenIconAndCaption = 20.0;
const textStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

class GenderCard extends StatelessWidget {
  final String text;
  final IconData icon;

  GenderCard({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: iconSize,
        ),
        Container(
          padding: const EdgeInsets.only(top: spaceBetweenIconAndCaption),
          child: Text(
            this.text,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
