import 'package:flutter_test/flutter_test.dart';
import '../models/firestore_post.dart';

void main() {
  // 3 part recipe to unit test = setup, exercise, verify
  test('Post created from Map should have appropriate property values', () {
    final date = DateTime.parse('2020-01-01');
    const imgURL = 'http://demo.com';
    const quantity = 1;
    const latitude = 1.1;
    const longitude = 2.2;
  });
}
