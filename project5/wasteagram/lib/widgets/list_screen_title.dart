import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ListScreenTitle extends StatefulWidget {
  StreamingSharedPreferences preferences;

  ListScreenTitle(this.preferences);

  @override
  _ListScreenTitleState createState() => _ListScreenTitleState();
}

class _ListScreenTitleState extends State<ListScreenTitle> {
  int totalQuanity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Preference<int> quantity =
        widget.preferences.getInt('totalQuantity', defaultValue: 0);

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
