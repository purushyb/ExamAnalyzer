import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/repositories/i_tools_repository.dart';
import 'package:exam_analyzer/data/repositories/score_report_repository.dart';
import 'package:exam_analyzer/data/repositories/tools_repository.dart';
import 'package:exam_analyzer/data/services/audio_service/pitch_detection_service.dart';
import 'package:exam_analyzer/data/services/audio_service/i_audio_service.dart';
import 'package:exam_analyzer/data/services/navigation/i_navigation_service.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart';
import 'package:exam_analyzer/data/services/storage/i_user_default_service.dart';
import 'package:exam_analyzer/data/services/storage/in_memory_user_defaults_service.dart';
import 'package:exam_analyzer/data/services/storage/local_memory_service.dart';
import 'package:exam_analyzer/data/services/storage/local_user_default_service.dart';
import 'package:exam_analyzer/data/services/storage/sql_lite_storage_service.dart';
import 'package:exam_analyzer/routing/navigation_service_impl.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/routing/router.dart';
import '/data/services/logging_service/i_logging_service.dart';
import '/data/services/logging_service/local_logging_service.dart';

late SharedPreferences _sharedPreferencesRef;
List<SingleChildWidget> _commonServices = [
  Provider(create: (context) => AppLocalization()),
  Provider(create: (context) => router()),
  Provider(
    create:
        (context) =>
            Navigationserviceimpl(router: context.read()) as INavigationService,
  ),
  Provider(
    lazy: false,
    create: (context) => PitchDetectionService(context.read()) as IAudioService,
  ),
];
List<SingleChildWidget> _commonRepositories = [
  Provider(
    create:
        (context) =>
            ScoreReportRepositoryImpl(
                  context.read(),
                  context.read(),
                  context.read(),
                  context.read(),
                )
                as IScoreReportRepository,
  ),
  Provider(
    create:
        (context) =>
            ToolsRepository(context.read(), context.read(), context.read())
                as IToolsRepository,
  ),
];
List<SingleChildWidget> _commonViewmodels = [];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> providersRemote(SharedPreferences prefReference) {
  _sharedPreferencesRef = prefReference;
  return [
    ..._commonServices,
    // This should be reverted
    Provider(create: (context) => LocalLoggingService() as ILoggingService),
    Provider(create: (context) => SQLiteStorageService() as IStorageService),
    Provider(
      create:
          (context) =>
              LocalUserDefaultsService(_sharedPreferencesRef)
                  as IUserDefaultsService,
    ),
    ..._commonRepositories,
    ..._commonViewmodels,
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
List<SingleChildWidget> get providersLocal {
  return [
    Provider(create: (context) => LocalLoggingService() as ILoggingService),
    ..._commonServices,
    Provider(
      create: (context) => LocalMemoryStorageService() as IStorageService,
    ),
    Provider(
      create:
          (context) => InMemoryUserDefaultsService() as IUserDefaultsService,
    ),
    ..._commonRepositories,
    ..._commonViewmodels,
  ];
}
