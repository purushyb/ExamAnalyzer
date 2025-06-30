import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '/routing/router.dart';
import '/data/services/logging_service/i_logging_service.dart';
import '/data/services/logging_service/local_logging_service.dart';

List<SingleChildWidget> _commonServices = [
  Provider(create: (context) => router()),
];
List<SingleChildWidget> _commonRepositories = [];
List<SingleChildWidget> _commonViewmodels = [];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [..._commonServices, ..._commonRepositories, ..._commonViewmodels];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
List<SingleChildWidget> get providersLocal {
  return [
    ..._commonServices,
    Provider(create: (context) => LocalLoggingService() as ILoggingService),
    ..._commonRepositories,
    ..._commonViewmodels,
  ];
}
