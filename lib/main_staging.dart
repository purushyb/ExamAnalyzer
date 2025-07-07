import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/dependencies.dart';
import 'main.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
/// Uses remote data from a server.
void main() async {
  Logger.root.level = Level.ALL;
  WidgetsFlutterBinding.ensureInitialized();
  final prefsInstance = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: providersRemote(prefsInstance),
      child: const MainApp(),
    ),
  );
}
