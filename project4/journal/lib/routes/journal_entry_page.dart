import 'package:flutter/material.dart';
import '../components/journal_drawer.dart';

class JournalEntryPage extends StatelessWidget {
  static const routeName = '/entry';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text("10/11/12"),
      ),
      body: JournalEntryWidget(),
      endDrawer: JournalDrawer(),
    );
  }
}

class JournalEntryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Example Title",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 10),
            Text(
              "I did not like this entry,I did not like this entry,I did not like this entry,I did not like this entry",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ));
  }
}
