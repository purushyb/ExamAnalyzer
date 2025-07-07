import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_development.dart' as development;

import '/ui/core/themes/theme.dart';
import '/ui/core/loacalization/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefsInstance = await SharedPreferences.getInstance();
  development.develop_main(prefsInstance);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: context.read<GoRouter>(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizationDelegate(),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
