// Created for providing dummy data
import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart';

class LocalMemoryStorageService implements IStorageService {
  final List<ScoreReport> _reports = [];
  int _nextId = 1;

  @override
  Future<bool> addScoreReport(ScoreReport report) async {
    final newReport = report.copyWith(id: _nextId++);
    _reports.add(newReport);
    return true;
  }

  @override
  Future<ScoreReport?> fetchScoreReport(int id) async {
    await checkAndInsertDate();
    return _reports.firstWhere((r) => r.id == id);
  }

  @override
  Future<List<ScoreReport>> fetchAllScoreReports() async {
    await checkAndInsertDate();
    return List.unmodifiable(_reports);
  }

  @override
  Future<bool> updateScoreReport(ScoreReport report) async {
    final index = _reports.indexWhere((r) => r.id == report.id);
    if (index == -1) return false;
    _reports[index] = report;
    return true;
  }

  @override
  Future<bool> deleteScoreReport(int id) async {
    _reports.removeWhere((r) => r.id == id);
    return true;
  }

  Future checkAndInsertDate() async {
    if (_reports.isEmpty) {
      await seedDummyData();
    }
  }

  /// 🔧 Add some dummy data to start with
  Future<void> seedDummyData() async {
    for (int i = 0; i < 10; i++) {
      await addScoreReport(
        ScoreReport(
          id: null,
          date: DateTime.now().subtract(Duration(days: 10 * i)),
          gseScore: 70 + i,
          listening: 65 + i,
          speaking: 60 + i,
          reading: 75 - i,
          writing: 68 + i,
          subskills: List.generate(5, (index) {
            return Subskill(
              subskill: index,
              skills: (index % 4) + 1,
              name: 'Subskill $index',
              description: 'Description for subskill $index',
              score: 50 + index * 5,
              content: '',
            );
          }),
        ),
      );
    }
  }
}
