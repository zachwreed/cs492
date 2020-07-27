import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// When we instantiate a ListView with an explicit list of widgets for its children, we should be aware that every object in the list, even those that won't be visible on the screen, will exist in memory

// Instead, use ListView builder, that can use the position of the scroll to know what listTile to render next

class JournalEntriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
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
