abstract class INavigationService {
  bool goToAttemptsListScreen();
  bool goToAddAttemptsScreen();
  bool goToAttemptDetailsScreen({required int? attemptId});
  bool goBack();
}
