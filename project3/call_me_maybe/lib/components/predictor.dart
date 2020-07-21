import 'package:flutter/material.dart';
import '../models/magic8ball.dart';

class Predictor extends StatefulWidget {
  Magic8Ball magic8ball = Magic8Ball();

  @override
  State createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  Widget build(BuildContext context) {
    String mb8Answer = widget.magic8ball.shake();

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
                    mb8Answer = widget.magic8ball.shake();
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
