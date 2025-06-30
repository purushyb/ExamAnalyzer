import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardViewModel extends ChangeNotifier {
  String _attemtCount = "";
  String get attemptsCount => _attemtCount;

  String _nextExamDate = "";
  String get nextExamDate => _nextExamDate;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  DashboardViewModel() {
    showLoading();
    _fetchAttempts(shouldNotify: false);
    _fetchNextExamDate(shouldNotify: false);
    stopLoading();
  }

  Future _fetchAttempts({bool shouldNotify = true}) async {
    final result = 10;
    _attemtCount = result.toString();
    notifyChanges(shouldNotify: shouldNotify);
  }

  Future _fetchNextExamDate({bool shouldNotify = true}) async {
    final result = DateTime.now();
    _nextExamDate = DateFormat.yMMMEd().format(result);
    notifyChanges(shouldNotify: shouldNotify);
  }

  void showLoading() {
    _isLoading = true;
    notifyChanges();
  }

  void stopLoading() {
    _isLoading = false;
    notifyChanges();
  }

  void notifyChanges({bool shouldNotify = true}) {
    if (shouldNotify) notifyListeners();
  }
}
