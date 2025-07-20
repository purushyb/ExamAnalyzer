import 'package:flutter/material.dart';

abstract class IThemeRepository extends ChangeNotifier {
  ThemeMode get themeMode;
  Future<void> setTheme(ThemeMode theme);
  bool getThemeWithReferenceToDarkTheme();
  Future<void> setThemeWithReferenceToDarkTheme(bool isThemeDark);
}
