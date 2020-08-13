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
  int quantity;

  void updatequantity(int quantityIn) {
    setState(() {
      quantity = quantityIn;
    });
    print("in parent");
  }

  @override
  Widget build(BuildContext context) {
    Text text;

    if (quantity == null) {
      text = Text("Wasted Items");
    } else {
      text = Text("Wasted Items: ${quantity}");
    }

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.settings),
        centerTitle: true,
        title: text,
      ),
      body: ListEntries(updatequantity: updatequantity),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Semantics(
        button: true,
        enabled: true,
        onTapHint: 'Select an image',
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(NewPostFormScreen.routeName);
            },
            child: Icon(Icons.camera),
          ),
        ),
      ),
    );
  }
}

class ListEntries extends StatelessWidget {
  final postCollection = PostCollection(documents: []);
  final void Function(int) updatequantity;

  ListEntries({this.updatequantity});

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
            print("total: ${postCollection.totalQuantity}");
            () async {
              updatequantity(postCollection.totalQuantity);
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
