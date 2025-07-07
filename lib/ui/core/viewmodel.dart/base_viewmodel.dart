import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

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

  void setError(String? message, {bool shouldNotify = true}) {
    _error = message;
    notifyChanges(shouldNotify: shouldNotify);
  }

  void clearError({bool shouldNotify = true}) {
    _error = null;
    notifyChanges(shouldNotify: shouldNotify);
  }
}
