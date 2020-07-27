import 'package:flutter/material.dart';

class JournalEntry extends StatefulWidget {
  @override
  _JournalEntryState createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  // Declare in stateful widget
  final formKey = GlobalKey<FormState>();
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        // Global handle for form
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              autofocus: true,
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
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                // check all validators before saving  the state
                if (formKey.currentState.validate()) {
                  // Looks through all form fields and saves value
                  formKey.currentState.save();
                  // Database.of(context).saveJournalEntry(fields)
                  // Navigator.of(context).pop();
                }
              },
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }
}
