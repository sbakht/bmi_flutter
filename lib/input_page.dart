import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: MyCard(active: false)),
                  Expanded(child: MyCard(active: false)),
                ],
              ),
            ),
            Expanded(child: MyCard(active: false)),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: MyCard(active: false)),
                  Expanded(child: MyCard(active: false)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final bool active;

  MyCard({this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Card(
        color: this.active ? Colors.blue : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: null,
      ),
    );
  }
}
