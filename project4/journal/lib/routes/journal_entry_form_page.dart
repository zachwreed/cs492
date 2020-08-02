import 'package:flutter/material.dart';
import '../components/journal_drawer.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';

// Route used for Journal Entry Form from FAB
class JournalEntryFormPage extends StatelessWidget {
  static const routeName = '/form';
  final void Function() updateBrightness;

  JournalEntryFormPage({this.updateBrightness});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text("Add New Entry"),
      ),
      body: JournalEntryForm(),
      endDrawer: JournalDrawer(updateBrightness: updateBrightness),
    );
  }
}

// Stateful implmentation of Journal Form
class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // Declare in stateful widget
  final formKey = GlobalKey<FormState>();
  String title;
  String body;
  int rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        // Global handle for form
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          children: <Widget>[
            Container(
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                // onSaved invoved by formkey.currentState.save()
                onSaved: (value) {
                  // Store value in some object
                  title = value;
                },
                // validator can check the data entered, if returns null, the value passes
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title';
                  }
                  print(value);
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                // onSaved invoved by formkey.currentState.save()
                onSaved: (value) {
                  // Store value in some object
                  body = value;
                },
                // validator can check the data entered, if returns null, the value passes
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a body';
                  }
                  print(value);
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: DropdownButtonFormField<int>(
                isExpanded: false,
                value: rating,
                items: [1, 2, 3, 4]
                    .map(
                      (val) => DropdownMenuItem(
                        child: Text(val.toString()),
                        value: val,
                      ),
                    )
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  rating = value;
                },
                // onSaved invoved by formkey.currentState.save()
                onSaved: (value) {
                  // Store value in some object
                },
                // validator can check the data entered, if returns null, the value passes
                validator: (value) {
                  if (value == null) {
                    return 'Please select a rating';
                  }

                  print(value);
                  return null;
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                RaisedButton(
                  onPressed: () async {
                    // check all validators before saving  the state
                    if (formKey.currentState.validate()) {
                      // Looks through all form fields and saves value
                      formKey.currentState.save();

                      final entry = JournalEntry(
                          title: title,
                          body: body,
                          rating: rating,
                          date: DateTime.now());

                      final dbm = DatabaseManager.getInstance();

                      dbm.saveJournalEntry(entry);

                      Navigator.of(context).pop(true);
                    }
                  },
                  child: Text('Save Entry'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
