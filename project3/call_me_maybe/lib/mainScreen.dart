import 'package:flutter/material.dart';

// Import Tab pages
import 'components/business_card.dart';
import 'components/predictor.dart';

class MainTabs extends StatelessWidget {
  final String title;

  // Constructor takes key to use as widget ID in constructor
  const MainTabs({Key key, this.title}) : super(key: key);

  // Override build method
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Color.fromARGB(230, 233, 234, 233),
        appBar: AppBar(
            title: Center(child: Text(title, textAlign: TextAlign.center)),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.face)),
                Tab(icon: Icon(Icons.note)),
                Tab(icon: Icon(Icons.help)),
              ],
            )),
        body: TabBarView(
          children: [
            BusinessCard(),
            Icon(Icons.note),
            Predictor(),
          ],
        ),
      ),
    );
  }
}
