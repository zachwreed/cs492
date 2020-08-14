import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ListScreenTitle extends StatefulWidget {
  @override
  _ListScreenTitleState createState() => _ListScreenTitleState();
}

class _ListScreenTitleState extends State<ListScreenTitle> {
  StreamingSharedPreferences preferences;
  int totalQuanity;

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  void getPreferences() async {
    preferences = await StreamingSharedPreferences.instance;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Preference<int> quantity =
        preferences.getInt('totalQuantity', defaultValue: 0);

    quantity.listen((value) {
      totalQuanity = value;
      setState(() {});
    });

    if (totalQuanity == 0) {
      return Text('Wasted Items');
    }
    return Text('Wasted Items: ${totalQuanity}');
  }
}
