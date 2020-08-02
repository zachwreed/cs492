import 'package:flutter/material.dart';
import 'package:journal/routes/journal_entry_page.dart';
import '../components/journal_drawer.dart';
import './journal_entry_form_page.dart';
import './journal_entry_page.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';

class JournalEntriesPage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text("Journal Entries"),
      ),
      body: JournalEntriesWidget(),
      endDrawer: JournalDrawer(),
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
    final Database db = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, date DATE, title TEXT, body TEXT, rating INTEGER)');
    });
    List<Map> journalRecords =
        await db.rawQuery('SELECT * FROM journal_entries');

    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date']),
      );
    }).toList();

    setState(() {
      journal = Journal(entries: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, idx) {
          return ListTile(
            // access each by items[index]
            title: Text(journal.entries[idx].title),
            subtitle: Text(journal.entries[idx].body),
            onTap: () =>
                Navigator.of(context).pushNamed(JournalEntryPage.routeName),
          );
        },
      ),
    );
  }
}
