import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/firestore_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: Text("Wasteagram Posts"),
      ),
      body: ListEntries(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(NewPostFormScreen.routeName);
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}

class ListEntries extends StatelessWidget {
  final posts = PostCollection();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection(posts.getCollectionName()).snapshots(),
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
              child: Text(
                  '${DateFormat.yMEd().format(document[posts.postDateKey].toDate())}')),
          Text('${document[posts.wastedItemsKey]}')
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: document);
      },
    );
  }
}
