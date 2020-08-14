import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/firestore_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ListScreenTitle extends StatefulWidget {
  @override
  _ListScreenTitleState createState() => _ListScreenTitleState();
}

class _ListScreenTitleState extends State<ListScreenTitle> {
  StreamingSharedPreferences preferences;
  int totalQuanity;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  void getPreferences() async {
    preferences = await StreamingSharedPreferences.instance;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Preference<int> quantity =
        preferences.getInt('totalQuantity', defaultValue: 0);

    quantity.listen((value) {
      totalQuanity = value;
      setState(() {});
    });

    if (totalQuanity == 0) {
      return Text('Wasted Items');
    }
    return Text('Wasted Items: ${totalQuanity}');
  }
}

class ListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListScreenTitle(),
      ),
      body: ListEntries(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Semantics(
        button: true,
        enabled: true,
        onTapHint: 'Select an image',
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Semantics(
            onTapHint: "Tap me",
            onLongPressHint: 'Tap me too',
            button: true,
            onTap: () => print('Tapped'),
            enabled: true,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NewPostFormScreen.routeName);
              },
              child: Icon(Icons.camera),
            ),
          ),
        ),
      ),
    );
  }
}

class ListEntries extends StatefulWidget {
  @override
  _ListEntriesState createState() => _ListEntriesState();
}

class _ListEntriesState extends State<ListEntries> {
  final postCollection = PostCollection(documents: []);
  StreamingSharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  void getPreferences() async {
    preferences = await StreamingSharedPreferences.instance;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection(postCollection.getCollectionName())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data.documents != null &&
            snapshot.data.documents.length > 0) {
          // create post objects from snapshot and sort them by newest
          print(snapshot.data.documents[0]);
          postCollection.fillDocumentsFromSnapshot(snapshot);
          postCollection.sortDocumentsByDate();

          if (postCollection.totalQuantity > 0) {
            preferences.setInt('totalQuantity', postCollection.totalQuantity);
          }

          return ListView.builder(
            itemCount: postCollection.documents.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, postCollection.documents[index]);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildListItem(BuildContext context, PostDocument post) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(child: Text('${post.getFormattedDateString()}')),
          Text('${post.quantity}')
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: post);
      },
    );
  }
}
