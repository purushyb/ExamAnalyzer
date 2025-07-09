import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:intl/intl.dart';

class NextExamDateViewmodel extends BaseViewModel {
  DateTime? _nextExamDate;
  DateTime? get nextExamDate => _nextExamDate;
  String get nextExamDateRedableFormat =>
      _nextExamDate != null ? DateFormat.yMMMEd().format(_nextExamDate!) : "";

  final IScoreReportRepository _repository;
  // ignore: unused_field
  final AppLocalization _localization;
  final INavigationService _navigationService;

  NextExamDateViewmodel({
    required IScoreReportRepository repository,
    required AppLocalization localization,
    required INavigationService navigationService,
  }) : _repository = repository,
       _localization = localization,
       _navigationService = navigationService {
    init();
  }

  @override
  Future init() async {
    showLoading();
    await Future.wait([_fetchNextExamDate()]);
    stopLoading();
  }

  Future _fetchNextExamDate({bool shouldNotify = true}) async {
    final result = _repository.getNextExamDate();
    if (result.isSuccess) {
      _nextExamDate = result.data;
      notifyChanges(shouldNotify: shouldNotify);
    } else {
      setError(result.error);
    }
  }

  void selectDate(DateTime date) {
    _nextExamDate = date;
    notifyChanges();
  }

  Future setNewExamDate() async {
    if (nextExamDate != null) {
      await _repository.setNextExamDate(nextExamDate!);
      _navigationService.goBack();
    }
  }
}
