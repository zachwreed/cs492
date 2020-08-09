class PostCollection {
  final String _collectionName = 'posts';

  String getCollectionName() {
    return _collectionName;
  }
}

class PostDocument {
  final String imgUrlKey = 'imgURL';
  final String latitudeKey = 'latitude';
  final String longitudeKey = 'longitude';
  final String postDateKey = 'postDate';
  final String wastedItemsKey = 'wastedItems';
}
