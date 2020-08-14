import 'package:flutter/material.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:sentry/sentry.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class WasteagramApp extends StatelessWidget {
  StreamingSharedPreferences preferences;

  WasteagramApp(this.preferences);

  @override
  Widget build(BuildContext context) {
    // throw StateError('Test Error');
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: {
        DetailScreen.routeName: (context) => DetailScreen(),
        ListScreen.routeName: (context) => ListScreen(preferences),
        NewPostFormScreen.routeName: (context) => NewPostFormScreen(),
      },
    );
  }

  static Future<void> reportError(
      dynamic error, dynamic stackTrace, String sentryURL) async {
    if (Foundation.kDebugMode) {
      print(stackTrace);
      return;
    }

    final SentryClient sentry = SentryClient(dsn: sentryURL);
    final SentryResponse response = await sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  }
}
