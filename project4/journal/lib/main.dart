// ************************************************
// Author: Zachary Reed
// Assignment: Project 4: Journal
// Date: 8/3/2020
// References:
// 1) Module Week 7 - Navigation, Forms, & Adaptive Layouts
//    Author: Nauman Chaudhry
//    Date Accessed: 7/21/2020
// 2) Module Week 8 - State Management & Data Persistence
//    Author: Nauman Chaudhry
//    Date Accessed: 7/21/2020
// ************************************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/shared_preferences/shared_preferences.dart';
import 'components/journal_app.dart';
import './db/database_manager.dart';
import 'shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set device orientations
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
