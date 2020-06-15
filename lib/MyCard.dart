import 'package:flutter/material.dart';

const inactiveColor = Color(0xFF111328);

class MyCard extends StatelessWidget {
  final bool active;
  final Widget child;

  MyCard({this.active, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Card(
        color: this.active ? null : inactiveColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
