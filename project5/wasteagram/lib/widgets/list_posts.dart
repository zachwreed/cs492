import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/firestore_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class ListPosts extends StatefulWidget {
  @override
  _ListPostsState createState() => _ListPostsState();
}

class _ListPostsState extends State<ListPosts> {
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

          preferences.setInt('totalQuantity', postCollection.totalQuantity);

          return ListView.builder(
            itemCount: postCollection.documents.length,
            itemBuilder: (context, index) {
              return _buildListItem(context, postCollection.documents[index]);
            },
          );
        } else {
          preferences.setInt('totalQuantity', 0);
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
