import 'package:exam_analyzer/routing/models/full_screen_page_data.dart';

abstract class INavigationService {
  bool goToAttemptsListScreen();
  bool goToAddAttemptsScreen();
  bool goToAttemptDetailsScreen({required int? attemptId});
  bool goToNextExamDateScreen();
  bool goToPitchDetectionScreen();
  bool goToAddNotes();
  bool goToFullScreenPage({required FullScreenPageData data});

  bool goBack();
}
