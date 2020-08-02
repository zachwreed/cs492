import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal/main.dart';
import '../routes/journal_entries_page.dart';
import '../routes/journal_entry_form_page.dart';
import '../routes/journal_entry_page.dart';

class JournalApp extends StatelessWidget {
  static final routes = {
    JournalEntriesPage.routeName: (context) => JournalEntriesPage(),
    JournalEntryFormPage.routeName: (context) => JournalEntryFormPage(),
    JournalEntryPage.routeName: (context) => JournalEntryPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(
        brightness: brightness,
      ),
      // home: JournalEntriesPage(),
      routes: routes,
    );
  }
}
