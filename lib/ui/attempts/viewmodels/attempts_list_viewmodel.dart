import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class AttemptsListViewmodel extends BaseViewModel {
  final List<ScoreReport> _reports = [];
  List<ScoreReport> get reports => _reports;

  final IScoreReportRepository _repository;
  final INavigationService _navigationService;

  AttemptsListViewmodel({
    required IScoreReportRepository repository,
    required INavigationService navigationService,
  }) : _repository = repository,
       _navigationService = navigationService {
    init();
  }

  Future init() async {
    showLoading();
    await Future.wait([_fetchAttempts(shouldNotify: false)]);
    stopLoading();
  }

  Future _fetchAttempts({bool shouldNotify = true}) async {
    var result = await _repository.getAll();
    _reports.addAll(result);
    notifyChanges(shouldNotify: shouldNotify);
  }

  void goToAttemptDetailsScreen({int? attemptId}) {
    _navigationService.goToAttemptDetailsScreen(attemptId: attemptId);
  }

  void goToAddAttemptScreen() {
    _navigationService.goToAddAttemptsScreen();
  }
}
