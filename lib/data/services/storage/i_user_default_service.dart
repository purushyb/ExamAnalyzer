abstract class IUserDefaultsService {
  Future<void> setNextExamDate(DateTime date);
  DateTime? getNextExamDate();

  Future<void> setNotesLink(String link);
  Future<String?> getNotesLink();

  Future<void> setThemeType(bool type);
  Future<bool?> getThemeType();

  Future<void> clear();
}
