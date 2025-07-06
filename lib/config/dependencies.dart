import 'package:exam_analyzer/data/repositories/i_score_report_repository.dart';
import 'package:exam_analyzer/data/repositories/score_report_repository.dart';
import 'package:exam_analyzer/data/services/logging_service/remote_logging_service.dart';
import 'package:exam_analyzer/data/services/storage/i_storage_service.dart' ;
import 'package:exam_analyzer/data/services/storage/local_memory_service.dart';
import 'package:exam_analyzer/data/services/storage/sql_lite_storage_Service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '/routing/router.dart';
import '/data/services/logging_service/i_logging_service.dart';
import '/data/services/logging_service/local_logging_service.dart';

List<SingleChildWidget> _commonServices = [
  Provider(create: (context) => router()),
];
List<SingleChildWidget> _commonRepositories = [
  Provider(
    create:
        (context) =>
            ScoreReportRepositoryImpl(context.read()) as IScoreReportRepository,
  ),
];
List<SingleChildWidget> _commonViewmodels = [];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [
    ..._commonServices,
    Provider(create: (context) => RemoteLoggingService() as ILoggingService),
    Provider(create: (context) => SQLiteStorageService() as IStorageService),
    ..._commonRepositories,
    ..._commonViewmodels,
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
List<SingleChildWidget> get providersLocal {
  return [
    ..._commonServices,
    Provider(create: (context) => LocalLoggingService() as ILoggingService),
    Provider(
      create: (context) => LocalMemoryStorageService() as IStorageService,
    ),
    ..._commonRepositories,
    ..._commonViewmodels,
  ];
}
