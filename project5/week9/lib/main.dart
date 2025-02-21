import 'package:flutter/material.dart';
import 'sections/shared_location_screen.dart';
import 'sections/shared_camera_screen.dart';
import 'sections/http_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: RemoteDataScreen(),
      ),
    );
  }
}
