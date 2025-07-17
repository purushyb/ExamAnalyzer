import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';

class RemoteLoggingService extends ILoggingService {
  @override
  void error({String? msg, Object? e, StackTrace? trace}) {
    // Not needed
  }

  @override
  void info(String msg) {
    // Not needed
  }
}
