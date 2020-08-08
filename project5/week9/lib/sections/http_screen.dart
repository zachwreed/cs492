import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class RemoteDataScreen extends StatefulWidget {
  static const URL = "https://swapi.dev/api/people/1";
  @override
  _RemoteDataScreenState createState() => _RemoteDataScreenState();
}

class _RemoteDataScreenState extends State<RemoteDataScreen> {
  // Character character;

  // @override
  // void initState() {
  //   super.initState();
  //   retrieveData();
  // }

  // void retrieveData() async {
  //   final http.Response apiResponse = await http.get(RemoteDataScreen.URL);
  //   character = Character.fromJson(jsonDecode(apiResponse.body));
  //   // Limit the closure passed to setState to only setting the state, rather than performing a significant amount of work.
  //   setState(() {});
  // }

  Future<http.Response> apiResponse = http.get(RemoteDataScreen.URL);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiResponse, // value to wait for
      builder: (context, snapshot) {
        // will be invoked with future is received
        Widget child;
        if (snapshot.hasData) {
          Character character =
              Character.fromJson(jsonDecode(snapshot.data.body));
          child = Text('${character.name}');
        } else if (snapshot.hasError) {
          // handle error
        } else {
          child = CircularProgressIndicator();
        }
        return Center(child: child);
      },
    );

    // Instead of this, use a futureBuilder
    // if (character == null) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // } else {
    //   return Center(child: Text('${character.name}'));
    // }
  }
}
