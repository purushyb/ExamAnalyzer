import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/routing/routes.dart';
import 'package:go_router/go_router.dart';

class Navigationserviceimpl extends INavigationService {
  late final GoRouter _router;

  Navigationserviceimpl({required GoRouter router}) : _router = router;

  @override
  bool goToAddAttemptsScreen() {
    _router.push(Routes.addAttempt);
    return true;
  }

  @override
  bool goToAttemptDetailsScreen({required int? attemptId}) {
    _router.push(Routes.attemptDetails, extra: attemptId);
    return true;
  }

  @override
  bool goToAttemptsListScreen() {
    _router.push(Routes.attempts);
    return true;
  }

  @override
  bool goToNextExamDateScreen() {
    _router.push(Routes.nextExamDate);
    return true;
  }

  @override
  bool goToAddNotes() {
    _router.push(Routes.linkNotes);
    return true;
  }

  @override
  bool goBack() {
    _router.pop();
    return true;
  }
}
