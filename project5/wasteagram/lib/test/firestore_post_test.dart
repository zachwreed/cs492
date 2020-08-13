import 'package:flutter_test/flutter_test.dart';
import '../models/firestore_post.dart';

void main() {
  // 3 part recipe to unit test = setup, exercise, verify
  sortPostsTest();
  dateStringTest();
}

void sortPostsTest() {
  test('Posts in collection should be sorted by date', () {
    PostDocument postOldest = PostDocument(
        'fake', 1.0, 2.0, 3, DateTime.now().subtract(Duration(days: 10)));
    PostDocument postMid = PostDocument(
        'fake', 1.0, 2.0, 3, DateTime.now().subtract(Duration(days: 5)));
    PostDocument postNewest = PostDocument('fake', 1.0, 2.0, 3, DateTime.now());

    // create collection and assign documents to list
    PostCollection collection = PostCollection();
    collection.documents = [postOldest, postNewest, postMid];

    // sort collection
    collection.sortDocumentsByDate();

    // check if postNewest is now at beginning and postOldest is last
    expect(postNewest, collection.documents[0]);
    expect(postOldest, collection.documents[2]);
  });
}

void dateStringTest() {
  test('Post created from Map should have appropriate property values', () {
    final expectedDateStr = 'Wed, 1/1/2020';
    final date = DateTime.parse('2020-01-01');
    const imgURL = 'http://demo.com';
    const quantity = 1;
    const latitude = 1.1;
    const longitude = 2.2;

    PostDocument post = PostDocument(
      imgURL,
      latitude,
      longitude,
      quantity,
      date,
    );

    expect(expectedDateStr, post.getFormattedDateString());
  });
}
