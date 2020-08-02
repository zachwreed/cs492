import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/shared_preferences/shared_preferences.dart';
import 'components/journal_app.dart';
import './db/database_manager.dart';
import 'shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Await database manager creation and shared preferences creation
  await DatabaseManager.initialize();
  await SharedPreferenceTheme.initialize();

  runApp((JournalApp()));
}
