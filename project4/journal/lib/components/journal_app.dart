import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/journal_entries_page.dart';
import '../routes/journal_entry_form_page.dart';
import '../routes/journal_entry_page.dart';
import '../shared_preferences/shared_preferences.dart';

class JournalApp extends StatefulWidget {
  @override
  _JournalAppState createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  final prefTheme = SharedPreferenceTheme();
  bool darkMode;

  @override
  void initState() {
    super.initState();
    setState(() {
      darkMode = prefTheme.getDarkMode();
    });
  }

  void updateBrightness() {
    setState(() {
      darkMode = prefTheme.getDarkMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness;

    if (darkMode) {
      brightness = Brightness.dark;
    } else {
      brightness = Brightness.light;
    }

    return MaterialApp(
      title: 'Adaptive Layout',
      theme: ThemeData(
        brightness: brightness,
      ),
      routes: {
        JournalEntriesPage.routeName: (context) =>
            JournalEntriesPage(updateBrightness: updateBrightness),
        JournalEntryFormPage.routeName: (context) =>
            JournalEntryFormPage(updateBrightness: updateBrightness),
        JournalEntryPage.routeName: (context) =>
            JournalEntryPage(updateBrightness: updateBrightness),
      },
    );
  }
}
