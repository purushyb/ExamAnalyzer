abstract class IUserDefaultsService {
  Future<void> setNextExamDate(DateTime date);
  DateTime? getNextExamDate();

  Future<void> setNotesLink(String link);
  Future<String?> getNotesLink();

  Future<void> clear();
}
