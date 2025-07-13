import 'package:exam_analyzer/data/repositories/i_tools_repository.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';

class LinkNotesViewmodel extends BaseViewModel {
  String _currentLink = "";
  String get currentLink => _currentLink;

  final IToolsRepository _repository;
  final INavigationService _navigationService;
  LinkNotesViewmodel(this._repository, this._navigationService) {
    init();
  }

  @override
  Future<void> init() async {
    showLoading();
    await Future.wait([_fetchPreviousLink()]).then((value) => stopLoading());
  }

  Future<void> _fetchPreviousLink() async {
    var result = await _repository.getNotesLink();
    if (result.isSuccess) {
      _currentLink = result.data!;
    }
  }

  void updateCurrentLink(String link) {
    _currentLink = link;
    notifyChanges();
  }

  Future submitLink() async {
    final result = await _repository.updateNotesLink(_currentLink);
    if (result.isSuccess) {
      _navigationService.goBack();
    } else {
      setError(result.error);
    }
  }
}
