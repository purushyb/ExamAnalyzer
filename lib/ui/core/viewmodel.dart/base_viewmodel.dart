import 'package:exam_analyzer/ui/core/ui/models/base_error_model.dart';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  BaseErrorModel? _error;
  BaseErrorModel? get error => _error;

  void notifyChanges({bool shouldNotify = true}) {
    if (shouldNotify) notifyListeners();
  }

  void showLoading({bool shouldNotify = true}) {
    _isLoading = true;
    notifyChanges(shouldNotify: shouldNotify);
  }

  void stopLoading({bool shouldNotify = true}) {
    _isLoading = false;
    notifyChanges(shouldNotify: shouldNotify);
  }

  void setError(
    String? message, {
    bool shouldNotify = true,
    bool shouldRetry = false,
  }) {
    if (message != null) {
      _error = BaseErrorModel(message: message, retry: shouldRetry);
      notifyChanges(shouldNotify: shouldNotify);
    }
  }

  void clearError({bool shouldNotify = true}) {
    _error = null;
    notifyChanges(shouldNotify: shouldNotify);
  }

  /// Should be overridden by subclasses to handle reload logic
  Future<void> init();

  @mustCallSuper
  void onRetry() {
    init();
  }
}
