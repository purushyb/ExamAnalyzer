import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:exam_analyzer/ui/core/themes/i_theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeRepository extends IThemeRepository {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  Future<void> setTheme(ThemeMode theme) async {
    _setTheme(theme);
    _saveTheme(theme);
    notifyListeners();
  }

  void _saveTheme(ThemeMode theme) {
    _userDefaults.setThemeType(theme == ThemeMode.dark);
  }

  @override
  bool getThemeWithReferenceToDarkTheme() => _themeMode == ThemeMode.dark;

  @override
  Future<void> setThemeWithReferenceToDarkTheme(bool isThemeDark) async {
    final theme = _themeFromBool(isThemeDark);
    _setTheme(theme);
    _saveTheme(theme);
  }

  final IUserDefaultsService _userDefaults;
  ThemeRepository(this._userDefaults) {
    init();
  }

  Future<void> init() async {
    final isCurrentThemeDark = await _userDefaults.getThemeType();
    var currentTheme = ThemeMode.system;
    if (isCurrentThemeDark != null) {
      currentTheme = _themeFromBool(isCurrentThemeDark);
    }
    _setTheme(currentTheme);
  }

  ThemeMode _themeFromBool(bool isDark) =>
      isDark ? ThemeMode.dark : ThemeMode.light;

  void _setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
