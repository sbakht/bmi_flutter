import 'package:flutter/material.dart';

import 'Constants.dart';

class MyCard extends StatelessWidget {
  final bool active;
  final Widget child;
  final Function onTap;

  MyCard({this.active, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Card(
          color: this.active ? null : kInactiveColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: child,
        ),
      ),
    );
  }
}
