abstract class ILoggingService {
  void info(String msg);
  void error({String? msg, Object? e, StackTrace? trace});
}
