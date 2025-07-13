abstract class INavigationService {
  bool goToAttemptsListScreen();
  bool goToAddAttemptsScreen();
  bool goToAttemptDetailsScreen({required int? attemptId});
  bool goToNextExamDateScreen();
  bool goToAddNotes();

  bool goBack();
}
