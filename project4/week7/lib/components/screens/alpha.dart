import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'beta.dart';
import 'donut.dart';

class Alpha extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textPlaceholder(context),
          betaButton(context),
          donutButton(context),
        ],
      ),
    );
  }

  // Navigation from screen to screen is done in a stack
  void pushBeta(BuildContext context) {
    Navigator.of(context).pushNamed(Beta.routeName, arguments: 42);
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) => Beta()),
    // );
  }

  void pushDonut(BuildContext context) {
    Navigator.of(context).pushNamed(Donut.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Alpha', style: Theme.of(context).textTheme.headline5);
  }

  Widget betaButton(BuildContext context) {
    return RaisedButton(
      child: Text('Beta'),
      onPressed: () => pushBeta(context),
    );
  }

  Widget donutButton(BuildContext context) {
    return RaisedButton(
      child: Text('Donut'),
      onPressed: () => pushDonut(context),
    );
  }
}
