import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import '../widgets/list_screen_title.dart';
import '../widgets/list_posts.dart';

class ListScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ListScreenTitle(),
      ),
      body: ListPosts(),
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
