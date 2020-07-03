// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// Main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: RandomWords(),
      theme: ThemeData(
         brightness: Brightness.dark,
        // primaryColor: Colors.white,
      )
    );
  }
}

// Public Random Word State class
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// Private Random Word State class
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();     // NEW
  final _biggerFont = TextStyle(fontSize: 18.0);

  // Will push saved word to Navigator stack for list
  void _pushSaved() {
    Navigator.of(context).push(
       MaterialPageRoute<void>(
        // Returns a scaffold containing the app bar for the new route named
        builder: (BuildContext context) {
          // Method of mapping all pairs in saved to ListTiles
          var map = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final tiles = map;
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
  
  // override points out that the function is also defined in an ancestor class, but is being redefined to do something else in the current class
  // -------------------------------
  // Creates application scaffold 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Startup Name Generator'),
        title: Text('Hello CS492!'),
        actions: [
          IconButton(
            icon: Icon(Icons.list), 
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }
  // -------------------------------
  // Builds wordpair rows with saveable button, LisvView makes it scrollable
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          
          // If Odd, add divider line 
          if (i.isOdd) {
            return Divider(); /*2*/
          }

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        }
      );
  }

  //-------------------------------
  // Builds tile and handles save state changes
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);  // NEW

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(   // NEW from here... 
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ), 
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      }
    );
  }
}
