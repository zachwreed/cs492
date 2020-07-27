import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week7/components/screens/journalEntryScreen.dart';
import 'screens/journalEntryScreen.dart';

class MyAppJournal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: JournalEntriesScreen(),
      ),
    );
  }
}
