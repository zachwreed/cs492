import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PostCollection {
  static const String collectionName = 'posts';

  List<PostDocument> documents;
  int totalQuantity;

  PostCollection({this.documents});

  String getCollectionName() {
    return collectionName;
  }

  void fillDocumentsFromSnapshot(AsyncSnapshot<dynamic> snapshot) {
    documents.clear();
    totalQuantity = 0;

    snapshot.data.documents.forEach((doc) {
      final post = PostDocument.fromSnapshotDocument(doc);
      totalQuantity += post.quantity;
      documents.add(post);
    });
  }

  void sortDocumentsByDate() {
    documents.sort((a, b) {
      if (a.date.isBefore(b.date)) {
        return 1;
      }
      return 0;
    });
  }
}

class PostDocument {
  static String imgUrlKey = 'imgURL';
  static String latitudeKey = 'latitude';
  static String longitudeKey = 'longitude';
  static String dateKey = 'date';
  static String quantityKey = 'quantity';

  final String imgUrl;
  final double latitude;
  final double longitude;
  final DateTime date;
  final int quantity;

  PostDocument(
      this.imgUrl, this.latitude, this.longitude, this.quantity, this.date);

  PostDocument.fromSnapshotDocument(DocumentSnapshot document)
      : this.imgUrl = document[imgUrlKey],
        this.latitude = document[latitudeKey],
        this.longitude = document[longitudeKey],
        this.quantity = document[quantityKey],
        this.date = document[dateKey].toDate();

  String getFormattedDateString() {
    return DateFormat.yMEd().format(this.date).toString();
  }

  void upload() async {
    await Firestore.instance.collection(PostCollection.collectionName).add({
      imgUrlKey: imgUrl,
      latitudeKey: latitude,
      longitudeKey: longitude,
      dateKey: Timestamp.fromDate(date),
      quantityKey: quantity,
    });
  }
}
