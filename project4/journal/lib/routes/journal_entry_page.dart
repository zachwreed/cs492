import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal/models/journal_entry.dart';
import '../components/journal_drawer.dart';

// Shows Journal Entry full details
class JournalEntryPage extends StatelessWidget {
  static const routeName = '/entry';
  final void Function() updateBrightness;

  JournalEntryPage({this.updateBrightness});

  @override
  Widget build(BuildContext context) {
    final JournalEntry entry = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text(entry.getDateString()),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              entry.title,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              entry.body,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rating: ${entry.rating}',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
      endDrawer: JournalDrawer(updateBrightness: updateBrightness),
    );
  }
}
