import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

// If widgets need to access global state, use materialApp class as a stateful widget
class MyAppState extends StatefulWidget {
  // This widget is the root of your application.
  @override
  MyAppStateState createState() => MyAppStateState();
}

class MyAppStateState extends State<MyAppState> {
  Counter counter;

  // When state object is created, next function called is initState before build is called
  void initState() {
    super.initState(); // always invoke initState
    counter = Counter(value: 0);
  }

  void updateCounter() {
    setState(() {
      counter.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // One way to pass state function is through the constructor
              DecreaseWidget(counter),
              IncreaseWidget(),
              LeaveMeAlone(),
              Alpha(
                updateCounter: updateCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void exampleFunction() async {
  // Shows declaration of future object created from SharedPreferences.getInstance()
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  prefs.then((value) {
    print(value.getKeys());
  });

  // to not have the then callback nesting, try using await. Function must be marked as async if this is the case.
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  print(prefs2.getKeys());
}

Future<int> example() {
  return Future.value(42);
}

// Implements the functionality of grabbing the ancestor state
class IncreaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyAppStateState scrollable =
        context.findAncestorStateOfType<MyAppStateState>();

    return Container(child: Text('${scrollable.counter.value} Done'));
  }
}

class DecreaseWidget extends StatelessWidget {
  final counter;

  DecreaseWidget(this.counter);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('${10 - counter.value} left'));
  }
}

// Since state change is happening at the highest level, LeaveMeAlone gets rebuilt
class LeaveMeAlone extends StatelessWidget {
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Leave me alone ${random.nextInt(100)}'));
  }
}

class Alpha extends StatelessWidget {
  final void Function() updateCounter;

  Alpha({this.updateCounter});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        // onPress simply calls function
        onPressed: updateCounter,
        child: Text('Tap me!'),
      ),
    );
  }
}

class Counter {
  int value;

  Counter({this.value});

  void increment() {
    this.value++;
  }
}
