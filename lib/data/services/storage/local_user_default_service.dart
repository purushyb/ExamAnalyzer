import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDefaultsService implements IUserDefaultsService {
  final SharedPreferences prefs;

  LocalUserDefaultsService(this.prefs);

  @override
  Future<void> setNextExamDate(DateTime date) async {
    await prefs.setString('next_exam_date', date.toIso8601String());
  }

  @override
  DateTime? getNextExamDate() {
    final string = prefs.getString('next_exam_date');
    return string != null ? DateTime.tryParse(string) : null;
  }

  @override
  Future<void> clear() async {
    await prefs.clear();
  }
}
