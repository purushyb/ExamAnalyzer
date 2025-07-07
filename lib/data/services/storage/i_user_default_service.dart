abstract class IUserDefaultsService {
  Future<void> setNextExamDate(DateTime date);
  DateTime? getNextExamDate();

  Future<void> clear();
}
