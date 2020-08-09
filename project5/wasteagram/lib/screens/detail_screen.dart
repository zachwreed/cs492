import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/firestore_post.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/post';

  @override
  Widget build(BuildContext context) {
    final FireStorePost post = FireStorePost();
    final DocumentSnapshot document = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${document[post.postDateKey].toDate()}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Items ${document[post.wastedItemsKey]}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Location (${document[post.latitudeKey]}, ${document[post.longitudeKey]})',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
