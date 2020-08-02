import 'package:flutter/material.dart';
import '../shared_preferences/shared_preferences.dart';

// Implements drawer used in route Scaffold
class JournalDrawer extends StatelessWidget {
  final void Function() updateBrightness;

  JournalDrawer({this.updateBrightness});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 65,
            child: DrawerHeader(
              child: Text("Settings", style: TextStyle(fontSize: 20)),
            ),
          ),
          ThemeSwitch(updateBrightness: updateBrightness),
        ],
      ),
    );
  }
}

// SwitchListTile must be wrapped in a stateful widget
class ThemeSwitch extends StatefulWidget {
  final void Function() updateBrightness;

  const ThemeSwitch({Key key, this.updateBrightness}) : super(key: key);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  final prefTheme = SharedPreferenceTheme();
  @override
  Widget build(BuildContext context) {
    bool darkMode = prefTheme.getDarkMode();

    return SwitchListTile(
      title: Text("Dark Mode"),
      onChanged: (bool value) {
        // updates shared_preferences key value and calls for rebuild of MaterialApp widget
        setState(() {
          prefTheme.setDarkMode(value);
          widget.updateBrightness();
        });
      },
      value: darkMode,
    );
  }
}
