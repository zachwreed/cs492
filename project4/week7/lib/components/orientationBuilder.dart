import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppOrientation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: AdaptiveWidget(),
      ),
    );
  }
}

class AdaptiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey,
        alignment: AlignmentDirectional(0.0, 0.0),
        constraints: BoxConstraints(
          maxHeight: 300,
          maxWidth: 500,
          minWidth: 300,
          minHeight: 200,
        ),
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? whiteSquare()
              : blackSquare();
        }),
      ),
    );
  }

  Widget whiteSquare() {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: 50,
        minWidth: 50,
        minHeight: 50,
      ),
    );
  }

  Widget blackSquare() {
    return Container(
      color: Colors.black,
      constraints: BoxConstraints(
        maxHeight: 50,
        maxWidth: 50,
        minWidth: 50,
        minHeight: 50,
      ),
    );
  }
}
