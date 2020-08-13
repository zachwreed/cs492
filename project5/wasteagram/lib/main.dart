import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/app.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String sentryURL = await rootBundle.loadString("assets/dsn.txt");

  Foundation.FlutterError.onError = (Foundation.FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };

  runZoned(() {
    runApp(WasteagramApp());
  }, onError: (error, stackTrace) {
    WasteagramApp.reportError(error, stackTrace, sentryURL);
  });
}
