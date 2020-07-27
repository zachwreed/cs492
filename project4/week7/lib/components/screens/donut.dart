import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week7/components/screens/beta.dart';

class Donut extends StatelessWidget {
  static const routeName = 'donut';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textPlaceholder(context),
          backButton(context),
          betaButton(context),
        ],
      ),
    );
  }

  // Navigation from screen to screen is done in a stack
  void backToAlpha(BuildContext context) {
    Navigator.of(context).pop();
  }

  void pushBeta(BuildContext context) {
    Navigator.of(context).pushNamed(Beta.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Donut', style: Theme.of(context).textTheme.headline5);
  }

  Widget backButton(BuildContext context) {
    return RaisedButton(
      child: Text('Back'),
      onPressed: () => backToAlpha(context),
    );
  }

  Widget betaButton(BuildContext context) {
    return RaisedButton(
      child: Text('Beta'),
      onPressed: () => pushBeta(context),
    );
  }
}
