import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/themes/i_theme_repository.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class SettingsViewmodel extends BaseViewModel {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  final INavigationService _navigationService;
  final IThemeRepository _themeService;
  SettingsViewmodel(this._navigationService, this._themeService) {
    init();
  }

  @override
  Future<void> init() async {
    _isDarkTheme = _themeService.getThemeWithReferenceToDarkTheme();
  }

  void toggleTheme(bool isDarkTheme) {
    _isDarkTheme = isDarkTheme;
    _themeService.setThemeWithReferenceToDarkTheme(isDarkTheme);
    notifyChanges();
  }

  void goToAddNotes() {
    _navigationService.goToAddNotes();
  }
}
