import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/dependencies.dart';
import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses local data.
void develop_main(SharedPreferences prefReference) {
  Logger.root.level = Level.ALL;

  runApp(
    MultiProvider(
      providers: providersLocal(prefReference),
      child: const MainApp(),
    ),
  );
}
