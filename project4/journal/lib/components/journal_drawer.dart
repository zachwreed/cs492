import 'package:flutter/material.dart';

class JournalDrawer extends StatelessWidget {
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
          ThemeSwitch(),
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({
    Key key,
  }) : super(key: key);

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Dark Mode"),
      onChanged: (bool value) {
        setState(() {
          darkMode = value;
        });
      },
      value: darkMode,
    );
  }
}
