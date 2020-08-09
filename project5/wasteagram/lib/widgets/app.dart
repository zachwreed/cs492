import 'package:flutter/material.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';

class WasteagramApp extends StatelessWidget {
  static final routes = {
    DetailScreen.routeName: (context) => DetailScreen(),
    ListScreen.routeName: (context) => ListScreen(),
    NewPostFormScreen.routeName: (context) => NewPostFormScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: routes,
    );
  }
}
