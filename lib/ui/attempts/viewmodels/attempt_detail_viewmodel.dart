import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:flutter/material.dart';

class AttemptDetailViewmodel extends ChangeNotifier {
  ScoreReport _attempt = ScoreReport(
    gseScore: 0,
    listening: 0,
    speaking: 0,
    reading: 0,
    writing: 0,
    subskills: [],
    date: DateTime.now(),
  );
  ScoreReport get attempt => _attempt;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  AttemptDetailViewmodel({required int attemptId}) {
    showLoading();
    _fetchAttempts(attemptId: attemptId, shouldNotify: false);
    stopLoading();
  }

  Future _fetchAttempts({
    required int attemptId,
    bool shouldNotify = true,
  }) async {
    var result = generateDummyScoreReports(10)[attemptId];
    _attempt = result;
    notifyChanges(shouldNotify: shouldNotify);
  }

  //Todo - this should be in local data provider
  List<ScoreReport> generateDummyScoreReports(int count) {
    return List.generate(count, (index) {
      return ScoreReport(
        gseScore: 70 + (index % 10),
        listening: 75 + (index % 5),
        speaking: 65 + (index % 7),
        reading: 72 + (index % 6),
        writing: 68 + (index % 8),
        date: DateTime.now().subtract(Duration(days: index * 7)),
        subskills: List.generate(8, (i) {
          return Subskill(
            subskill: i + 1,
            skills: i < 4 ? 8 : 4,
            name: 'Subskill ${i + 1}',
            description: 'Description ${i + 1}',
            score: 50 + ((index + i) % 50),
            content: '', // empty content as per request
          );
        }),
      );
    });
  }

  void showLoading() {
    _isLoading = true;
    notifyChanges();
  }

  void stopLoading() {
    _isLoading = false;
    notifyChanges();
  }

  void notifyChanges({bool shouldNotify = true}) {
    if (shouldNotify) notifyListeners();
  }
}
