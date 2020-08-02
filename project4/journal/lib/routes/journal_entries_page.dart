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
    // Triggers reload
    loadJournal();

    // Return loader if journal is null
    if (journal == null) {
      return Center(child: CircularProgressIndicator());
    }

    // Show welcome icon if no entries are available
    if (journal.isEmpty()) {
      return Center(
        child: Icon(
          Icons.note,
          size: 100,
        ),
      );
    }

    // Show either vertical or horizontal componets based on width
    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 500
              ? VerticalLayout(journal: journal)
              : HorizontalLayout(journal: journal);
        },
      ),
    );
  }
}

// Shows Journal Entries in portrait mode
class VerticalLayout extends StatelessWidget {
  final Journal journal;

  VerticalLayout({this.journal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, idx) {
          return ListTile(
            // access each by items[index]
            title: Text(journal.entries[idx].title),
            subtitle: Text(journal.entries[idx].getDateString()),
            onTap: () => Navigator.of(context).pushNamed(
                JournalEntryPage.routeName,
                arguments: journal.entries[idx]),
          );
        },
      ),
    );
  }
}

// Shows entries in landscape mode with master details
class HorizontalLayout extends StatelessWidget {
  final Journal journal;

  HorizontalLayout({this.journal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: journal.entries.length,
        itemBuilder: (context, idx) {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .60,
                child: ListTile(
                  // access each by items[index]
                  title: Text(journal.entries[idx].title,
                      style: TextStyle(fontSize: 20)),
                  subtitle: Text(journal.entries[idx].getDateString(),
                      style: TextStyle(fontSize: 15)),
                  onTap: () => Navigator.of(context).pushNamed(
                      JournalEntryPage.routeName,
                      arguments: journal.entries[idx]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      journal.entries[idx].title,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 10),
                    Text(
                      journal.entries[idx].body,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rating: ${journal.entries[idx].rating}',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
