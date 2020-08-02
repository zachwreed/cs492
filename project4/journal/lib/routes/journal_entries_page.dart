import 'package:flutter/material.dart';
import 'package:journal/routes/journal_entry_page.dart';
import '../components/journal_drawer.dart';
import './journal_entry_form_page.dart';
import './journal_entry_page.dart';
import '../models/journal_entry.dart';
import '../db/database_manager.dart';

class JournalEntriesPage extends StatelessWidget {
  static const routeName = '/';

  final void Function() updateBrightness;

  JournalEntriesPage({this.updateBrightness});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text("Journal Entries"),
      ),
      body: JournalEntriesWidget(),
      endDrawer: JournalDrawer(updateBrightness: updateBrightness),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(JournalEntryFormPage.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class JournalEntriesWidget extends StatefulWidget {
  @override
  _JournalEntriesWidgetState createState() => _JournalEntriesWidgetState();
}

class _JournalEntriesWidgetState extends State<JournalEntriesWidget> {
  Journal journal;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final dbm = DatabaseManager.getInstance();

    List<JournalEntry> journalEntries = await dbm.getJournalEntries();
    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    loadJournal();

    return Container(
      child: ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, idx) {
          return ListTile(
            // access each by items[index]
            title: Text(journal.entries[idx].title),
            subtitle: Text(journal.entries[idx].body),
            onTap: () => Navigator.of(context).pushNamed(
                JournalEntryPage.routeName,
                arguments: journal.entries[idx]),
          );
        },
      ),
    );
  }
}
