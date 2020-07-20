import 'package:flutter/material.dart';
import 'screens/alpha_screen.dart';
import 'screens/chi_screen.dart';
import 'screens/beta_screen.dart';

class MainScreen extends StatelessWidget {
  final String title;

  // Constructor takes key to use as widget ID in constructor
  const MainScreen({Key key, this.title}) : super(key: key);

  // Override build method
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      // Wrap all children in scaffold
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
              tabs: [Tab(text: 'Alpha'), Tab(text: 'Beta'), Tab(text: 'Chi')]),
        ),
        body: TabBarView(children: [AlphaScreen(), BetaScreen(), ChiScreen()]),
      ),
    );
  }
}
