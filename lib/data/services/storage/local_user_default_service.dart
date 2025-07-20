import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDefaultsService implements IUserDefaultsService {
  final SharedPreferences prefs;

  final String _nextExamDateKey = "next_exam_date";
  final String _notesLinkKey = "notes_link_key";
  final String _darkThemeKey = "dark_theme_key";

  LocalUserDefaultsService(this.prefs);

  @override
  Future<void> setNextExamDate(DateTime date) async {
    await prefs.setString(_nextExamDateKey, date.toIso8601String());
  }

  @override
  DateTime? getNextExamDate() {
    final result = prefs.getString(_nextExamDateKey);
    return result != null ? DateTime.tryParse(result) : null;
  }

  @override
  Future<void> clear() async {
    await prefs.clear();
  }

  @override
  Future<String?> getNotesLink() async {
    final result = prefs.getString(_notesLinkKey);
    return result;
  }

  @override
  Future<void> setNotesLink(String link) async {
    await prefs.setString(_notesLinkKey, link);
  }

  @override
  Future<bool?> getThemeType() async {
    final result = prefs.getBool(_darkThemeKey);
    return result;
  }

  @override
  Future<void> setThemeType(bool type) async {
    await prefs.setBool(_darkThemeKey, type);
  }
}
