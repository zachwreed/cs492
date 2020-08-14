import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/post_form.dart';

class NewPostFormScreen extends StatelessWidget {
  static const routeName = '/new';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Post"),
      ),
      body: PostForm(),
    );
  }
}
