import 'package:flutter/material.dart';
import 'screens/alpha.dart';
import 'screens/beta.dart';
import 'screens/donut.dart';

class NavApp extends StatelessWidget {
  static final routes = {
    Alpha.routeName: (context) => Alpha(),
    Beta.routeName: (context) => Beta(),
    Donut.routeName: (context) => Donut()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: ThemeData.dark(),
      // Pass in a map of routes
      routes: routes,
    );
  }
}
