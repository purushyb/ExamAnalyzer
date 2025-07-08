import 'dart:async';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class AttemptsListViewmodel extends BaseViewModel {
  List<ScoreReport> _reports = [];
  List<ScoreReport> get reports => _reports;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;
  late final StreamSubscription<List<ScoreReport>> _subscription;

  AttemptsListViewmodel({
    required IScoreReportRepository repository,
    required INavigationService navigationService,
  }) : _repository = repository,
       _navigationService = navigationService {
    init();
  }
  @override
  Future init() async {
    showLoading();
    await Future.wait([_fetchAttempts()]);
    stopLoading();
  }

  Future _fetchAttempts() async {
    _subscription = _repository.scoreReportsStream.listen((data) {
      _reports = data;
      notifyChanges();
    });
    var result = await _repository.getAll();
    _reports.addAll(result);
    notifyChanges();
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
