import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/widgets/app.dart';

void main() {
  runApp(WasteagramApp());
}

class FireStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('FireStore Test')),
        body: FireStoreStreamBuilder(),
      ),
    );
  }
}

class FireStoreStreamBuilder extends StatelessWidget {
  const FireStoreStreamBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('bandnames').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data.documents != null &&
            snapshot.data.documents.length > 0) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, snapshot.data.documents[index]);
            },
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(child: Text(document['name'])),
          Expanded(child: Text('${document['votes']}'))
        ],
      ),
      onTap: () {
        Firestore.instance.runTransaction((transaction) async {
          DocumentSnapshot freshSnap =
              await transaction.get(document.reference);
          await transaction
              .update(freshSnap.reference, {'votes': freshSnap['votes'] + 1});
        });
      },
    );
  }
}
