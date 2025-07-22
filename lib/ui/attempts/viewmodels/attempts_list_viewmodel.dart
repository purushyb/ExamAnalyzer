import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class AttemptsListViewmodel extends BaseViewModel {
  List<ScoreReport> _attempts = [];
  List<ScoreReport> get attempts => _attempts;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;
  late final StreamSubscription<Result<List<ScoreReport>>> _subscription;

  AttemptsListViewmodel(this._repository, this._navigationService) {
    init();
  }
  @override
  Future init() async {
    showLoading();
    await Future.wait([_fetchAttempts()]).then((value) => stopLoading());
  }

  Future _fetchAttempts() async {
    _subscription = _repository.scoreReportsStream.listen(
      (result) => checkAndPopulateReportsDate(result),
    );

    _repository.getAll().then((result) => checkAndPopulateReportsDate(result));
  }

  void checkAndPopulateReportsDate(Result<List<ScoreReport>> result) {
    if (result.isSuccess) {
      _attempts = result.data!;
      notifyChanges();
    } else {
      setError(result.error);
    }
  }

  void goToAttemptDetailsScreen({int? attemptId}) {
    _navigationService.goToAttemptDetailsScreen(attemptId: attemptId);
  }

  void goToAddAttemptScreen() {
    _navigationService.goToAddAttemptsScreen();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
