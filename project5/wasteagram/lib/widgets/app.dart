import 'package:flutter/material.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:sentry/sentry.dart';

class WasteagramApp extends StatelessWidget {
  static final routes = {
    DetailScreen.routeName: (context) => DetailScreen(),
    ListScreen.routeName: (context) => ListScreen(),
    NewPostFormScreen.routeName: (context) => NewPostFormScreen(),
  };

  @override
  Widget build(BuildContext context) {
    // throw StateError('Test Error');
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      routes: routes,
    );
  }

  static Future<void> reportError(
      dynamic error, dynamic stackTrace, String sentryURL) async {
    // if (Foundation.kDebugMode) {
    //   print(stackTrace);
    //   return;
    // }

    final SentryClient sentry = SentryClient(dsn: sentryURL);
    final SentryResponse response = await sentry.captureException(
      exception: error,
      stackTrace: stackTrace,
    );
  }
}
