import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week7/components/journal.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp((MyAppJournal()));
}
