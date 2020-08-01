import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/journal_app.dart';

// Global theme brightness
Brightness brightness = Brightness.light;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp((JournalApp()));
}
