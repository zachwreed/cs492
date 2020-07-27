import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week7/components/screens/donut.dart';

class Beta extends StatelessWidget {
  static const routeName = 'beta';

  @override
  Widget build(BuildContext context) {
    // Receive parameter from pushNamed(<route>) argument
    final int receivedValue = ModalRoute.of(context).settings.arguments;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textPlaceholder(context),
          backButton(context),
          donutButton(context),
        ],
      ),
    );
  }

  // Navigation from screen to screen is done in a stack
  void backToAlpha(BuildContext context) {
    Navigator.of(context).pop();
  }

  void pushDonut(BuildContext context) {
    // Use pop and push name to return from Donut to Alpha
    Navigator.of(context).popAndPushNamed(Donut.routeName);
  }

  Widget textPlaceholder(BuildContext context) {
    return Text('Beta', style: Theme.of(context).textTheme.headline5);
  }

  Widget backButton(BuildContext context) {
    return RaisedButton(
      child: Text('Back'),
      onPressed: () => backToAlpha(context),
    );
  }

  Widget donutButton(BuildContext context) {
    return RaisedButton(
      child: Text('Donut'),
      onPressed: () => pushDonut(context),
    );
  }
}
