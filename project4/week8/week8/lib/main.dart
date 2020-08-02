import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';

const SECRET_KEY_PATH = 'assets/secret_key.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get directory for device path using path_provider and then get string path to
  Directory documentsDir = await getApplicationDocumentsDirectory();
  String documentsPath = documentsDir.path;

  // This will write a file to the simulated device
  final File file = File('$documentsPath/example.txt');
  await file.writeAsString('Important data here.');

  // use rootBundle to access the bundle. Bundle is the combination of all assets, files, packages available to the application.
  String apiKey = await rootBundle.loadString(SECRET_KEY_PATH);
  print(apiKey);
  runApp(App(preferences: await SharedPreferences.getInstance()));
}

class App extends StatefulWidget {
  final SharedPreferences preferences;

  App({Key key, @required this.preferences}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const FAVORITE_THING_KEY = 'favoriteThing';

  // Create a getter to fetch the string directly from sharedPreferences
  String get favoriteThing =>
      widget.preferences.getString(FAVORITE_THING_KEY) ?? 'Intial Lasagna';

  // While initState can't be async, it can invoke an async function
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                favoriteThing,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Pick new thing'),
                onPressed: pickNewFavoriteThing,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void pickNewFavoriteThing() async {
  //   setState(() {
  //     favoriteThing = generateWordPairs().take(1).first.join(' ');
  //   });
  //   // get instance of shared preferences and block.
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('favoriteThing', favoriteThing);
  // }

  void pickNewFavoriteThing() {
    setState(() {
      String favoriteThing = generateWordPairs().take(1).first.join(' ');
      widget.preferences.setString('favoriteThing', favoriteThing);
    });
    // get instance of shared preferences and block.
    // widget.preferences.setString('favoriteThing', favoriteThing);
  }
}
