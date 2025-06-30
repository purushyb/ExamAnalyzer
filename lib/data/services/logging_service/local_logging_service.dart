import '/data/services/logging_service/i_logging_service.dart';
import 'package:logger/logger.dart';

class LocalLoggingService extends ILoggingService {
  final Logger _logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );

  @override
  void info(msg) {
    _logger.d(msg);
  }

  @override
  void error({String? msg, Object? e, StackTrace? trace}) {
    _logger.e(msg ?? "Error!", error: e, stackTrace: trace);
  }
}
