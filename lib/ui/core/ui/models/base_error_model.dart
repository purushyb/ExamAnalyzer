class BaseErrorModel {
  final String message;
  final bool retry;

  const BaseErrorModel({required this.message, this.retry = false});
}
