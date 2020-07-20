import 'package:flutter/material.dart';
import 'dart:math';

class Predictor extends StatefulWidget {
  final List<String> m8bValues = [
    "Unlikely but possible",
    "The future is uncertain",
    "Maybe... We'll see",
    "Yes, for sure",
    "Without a doubt",
    "There's a strong possibility"
  ];
  final Random random = Random();

  @override
  State createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  Widget build(BuildContext context) {
    final int m8bSize = widget.m8bValues.length;
    String mb8Answer = widget.m8bValues[widget.random.nextInt(m8bSize)];

    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.9,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Call Me Maybe?",
                  style: TextStyle(fontFamily: 'Rowdies', fontSize: 25.0)),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mb8Answer =
                        widget.m8bValues[widget.random.nextInt(m8bSize)];
                  });
                },
                child: Text("Ask a question...Tap for answer",
                    style: TextStyle(fontFamily: 'Rowdies', fontSize: 20.0)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(mb8Answer,
                  style: TextStyle(fontFamily: 'Rowdies', fontSize: 25.0)),
            ),
          ],
        ),
      ),
    );
  }
}
