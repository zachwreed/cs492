import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PostCollection {
  static const String collectionName = 'posts';

  List<PostDocument> documents;

  PostCollection({this.documents});

  String getCollectionName() {
    return collectionName;
  }

  void fillDocumentsFromSnapshot(AsyncSnapshot<dynamic> snapshot) {
    documents.clear();
    snapshot.data.documents.forEach((doc) {
      documents.add(PostDocument.fromSnapshotDocument(doc));
    });
  }
}

class PostDocument {
  static String imgUrlKey = 'imgURL';
  static String latitudeKey = 'latitude';
  static String longitudeKey = 'longitude';
  static String postDateKey = 'postDate';
  static String wastedItemsKey = 'wastedItems';

  final String imgUrl;
  final double latitude;
  final double longitude;
  final DateTime postDate;
  final int wastedItems;

  PostDocument(this.imgUrl, this.latitude, this.longitude, this.postDate,
      this.wastedItems);

  PostDocument.fromSnapshotDocument(DocumentSnapshot document)
      : this.imgUrl = document[imgUrlKey],
        this.latitude = document[latitudeKey],
        this.longitude = document[longitudeKey],
        this.postDate = document[postDateKey].toDate(),
        this.wastedItems = document[wastedItemsKey];

  String getFormattedDateString() {
    return DateFormat.yMEd().format(this.postDate).toString();
  }

  void upload() async {
    await Firestore.instance.collection(PostCollection.collectionName).add({
      imgUrlKey: imgUrl,
      latitudeKey: latitude,
      longitudeKey: longitude,
      postDateKey: Timestamp.fromDate(postDate),
      wastedItemsKey: wastedItems,
    });
  }
}
