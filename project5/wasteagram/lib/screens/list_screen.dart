import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/firestore_post.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int wastedItems;

  void updateWastedItems(int wastedItemsIn) {
    setState(() {
      wastedItems = wastedItemsIn;
    });
    print("in parent");
  }

  @override
  Widget build(BuildContext context) {
    Text text;

    if (wastedItems == null) {
      text = Text("Wasted Items");
    } else {
      text = Text("Wasted Items: ${wastedItems}");
    }

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: text,
      ),
      body: ListEntries(updateWastedItems: updateWastedItems),
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
  final postCollection = PostCollection(documents: []);
  final void Function(int) updateWastedItems;

  ListEntries({this.updateWastedItems});

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
          postCollection.fillDocumentsFromSnapshot(snapshot);
          postCollection.sortDocumentsByDate();

          if (postCollection.totalWastedItems > 0) {
            print("total: ${postCollection.totalWastedItems}");
            () async {
              updateWastedItems(postCollection.totalWastedItems);
            }();
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
          Text('${post.wastedItems}')
        ],
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailScreen.routeName, arguments: post);
      },
    );
  }
}
