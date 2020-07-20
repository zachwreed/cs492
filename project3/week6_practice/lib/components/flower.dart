import 'package:flutter/material.dart';
import '../models/die.dart';
import 'package:url_launcher/url_launcher.dart';

class Flower extends StatefulWidget {
  @override
  State createState() => _FlowerState();
}

class _FlowerState extends State<Flower> {
  final die = Die(numberOfSides: 20);

  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${die.currentValue}',
            style: Theme.of(context).textTheme.headline1,
          ),
          GestureDetector(
            onTap: () {
              // launch('https://');
              launch('sms:5555555555');
            },
            child: Image.asset('assets/images/flower.jpg'),
          ),
        ],
      ),
    );
  }

  double padding(BuildContext context) {
    // if context is landscape
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.width * 0.05;
    } else {
      return MediaQuery.of(context).size.width * 0.1;
    }
  }

  void displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Flower Power!'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

// class Apple extends StatefulWidget {
//   @override
//   State createState() => AppleState();
// }

// class AppleState extends State<Apple> {
//   @override
//   State<Apple> initState() {
//     // initialize state
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Text('Apple');
//   // }
// }
