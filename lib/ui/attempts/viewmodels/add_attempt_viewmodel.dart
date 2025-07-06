import 'dart:convert';
import 'dart:io';

import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:flutter/material.dart';

class AddAttemptViewmodel extends ChangeNotifier {
  DateTime? _date;
  DateTime? get date => _date;

  ScoreReport? _report;
  ScoreReport? get report => _report;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future parseReport(String path) async {
    final jsonString = await File(path).readAsString();
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    if (date != null) {
      jsonMap['date'] = date?.toIso8601String();
    }

    _report = ScoreReport.fromJson(jsonMap);
    notifyChanges();
  }

  void selectDate(DateTime date) {
    _date = date;
    notifyChanges();
  }

  void addAttempt(){
    
  }

  void submit() {}

  void showLoading() {
    _isLoading = true;
  }

  void hideLoading() {
    _isLoading = false;
  }

  void notifyChanges({bool shouldNotify = true}) {
    if (shouldNotify) notifyListeners();
  }
}
