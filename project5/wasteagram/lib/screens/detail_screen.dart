import 'package:flutter/material.dart';
import 'package:wasteagram/models/firestore_post.dart';
import 'package:wasteagram/widgets/post_detail.dart';

// https://api.flutter.dev/flutter/widgets/Image/loadingBuilder.html
class DetailScreen extends StatelessWidget {
  static const routeName = '/post';

  @override
  Widget build(BuildContext context) {
    final PostDocument post = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wasteagram Post'),
      ),
      body: PostDetails(post),
    );
  }
}
