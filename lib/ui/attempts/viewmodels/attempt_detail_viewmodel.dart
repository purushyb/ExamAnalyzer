import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class AttemptDetailViewmodel extends BaseViewModel {
  ScoreReport? _attempt;
  ScoreReport? get attempt => _attempt;

  int? _currentReportId;
  IScoreReportRepository _repository;

  AttemptDetailViewmodel({
    required IScoreReportRepository repository,
    required int? attemptId,
  }) : _repository = repository {
    _currentReportId = attemptId;
    init();
  }
  @override
  Future init() async {
    showLoading();
    if (_currentReportId != null) {
      await Future.wait([
        _fetchAttempts(attemptId: _currentReportId!, shouldNotify: false),
      ]).then((value) {
        stopLoading();
      });
    }
  }

  Future _fetchAttempts({
    required int attemptId,
    bool shouldNotify = true,
  }) async {
    var result = await _repository.get(attemptId);
    if (result.isSuccess) {
      _attempt = result.data;
      notifyChanges(shouldNotify: shouldNotify);
    } else {
      setError(result.error);
    }
  }
}
