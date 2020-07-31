import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'journal_drawer.dart';

class JournalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.settings),
          centerTitle: true,
          title: Text("Journal Entries"),
        ),
        body: Text("example"),
        endDrawer: JournalDrawer(),
      ),
    );
  }
}
