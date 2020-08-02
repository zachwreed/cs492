import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal/models/journal_entry.dart';
import '../components/journal_drawer.dart';

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
          title: Text(DateFormat.yMEd().format(entry.date))),
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
          ],
        ),
      ),
      endDrawer: JournalDrawer(updateBrightness: updateBrightness),
    );
  }
}
