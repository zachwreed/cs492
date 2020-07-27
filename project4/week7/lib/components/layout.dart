// Demonstrates layoutBuilder
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week7/components/screens/alpha.dart';

class MyAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 500
                ? VerticalLayout()
                : HorizontalLayout();
          },
        ),
      ),
    );
  }
}

class VerticalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}

class HorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(color: Colors.green)),
        Expanded(child: Container(color: Colors.orange)),
        Alpha(),
      ],
    );
  }
}
