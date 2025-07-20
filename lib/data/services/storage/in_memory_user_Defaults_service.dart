import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';

class InMemoryUserDefaultsService implements IUserDefaultsService {
  DateTime? _nextExamDate;
  String? _notesLink;
  bool _isThemeDark = false;

  @override
  Future<void> setNextExamDate(DateTime date) async {
    _nextExamDate = date;
  }

  @override
  DateTime? getNextExamDate() {
    return _nextExamDate;
  }

  @override
  Future<void> clear() async {
    _nextExamDate = null;
  }

  @override
  Future<String?> getNotesLink() async {
    return _notesLink;
  }

  @override
  Future<void> setNotesLink(String link) async {
    _notesLink = link;
  }

  @override
  Future<bool?> getThemeType() async {
    return _isThemeDark;
  }

  @override
  Future<void> setThemeType(bool type) async {
    _isThemeDark = type;
  }
}
