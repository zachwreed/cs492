import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal/main.dart';
import 'journal_drawer.dart';
import '../routes/journal_entries_widget.dart';
import '../routes/journal_entries_form.dart';

class JournalApp extends StatelessWidget {
  static final routes = {
    JournalEntriesWidget.routeName: (context) => JournalEntriesWidget(),
    JournalEntryForm.routeName: (context) => JournalEntryForm()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(
        brightness: brightness,
      ),
      home: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.settings),
          centerTitle: true,
          title: Text("Journal Entries"),
        ),
        body: JournalEntriesWidget(),
        endDrawer: JournalDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(JournalEntryForm.routeName);
          },
          child: Icon(Icons.add),
        ),
      ),
      routes: routes,
    );
  }
}
