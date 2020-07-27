// Demonstrates builder
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppScaffold extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layouts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: Center(child: Text('Builder Demo')),
        // Builder takes a BuildContext as a parameter with a closure callback. It is not the same context defined in the build() function above, rather it is the parent, Scaffold, build context
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(onPressed: () {
            // Context here needs to be within a build, as the Scaffold.of method looks up the widget heirarchy, and doesn't find a scaffold above the build method's context
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Snack')));
          });
        }),
      ),
    );
  }
}
