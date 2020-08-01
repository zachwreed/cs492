import 'package:flutter/material.dart';

class JournalEntriesWidget extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            // access each by items[index]
            leading: FlutterLogo(),
            trailing: Icon(Icons.more_horiz),
            title: Text('Journal Entry N'),
            subtitle: Text('Example subtitle'),
            // onTap: Navigator.of(context).pushName
          );
        },
      ),
    );
  }
}
