import 'package:flutter/material.dart';
import 'mainScreen.dart';

// Stateless widget is an abstract class
class MyApp extends StatelessWidget {
  final String title;

  const MyApp({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides necessary padding for the app area
    return MaterialApp(
      title: 'Week 6',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainTabs(title: title),
    );
  }
}
