import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
    'attempts': "Attempts",
    'examDate': "Exam Date",
    'scoreTrend': 'Score Trend',
    'speaking': 'Speaking',
    'reading': 'Reading',
    'listening': 'Listening',
    'writing': 'Writing',
    'skillBreakdown': 'Skill Breakdown',
    'overall': 'Overall {value}',
    'subSkillBreakdown': 'Sub Skill Breakdown',
    'attemptDate': 'Attempt Date',
    'noDateMsg': "No Date Selected",
    'uploadSkillProfile': "Upload Skill Profile JSON",
    'addAttempt': "Add Attempt",
  };

  // If string for "label" does not exist, will show "[LABEL]"
  static String _get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  String get attempts => _get('attempts');
  String get examDate => _get('examDate');
  String get scoreTrend => _get('scoreTrend');
  String get speaking => _get('speaking');
  String get reading => _get('reading');
  String get writing => _get('writing');
  String get listening => _get('listening');
  String get skillBreakdown => _get('skillBreakdown');
  String overall(String value) => _get('overall').replaceAll('{value}', value);
  String get subSkillBreakDown => _get('subSkillBreakdown');
  String get attemptDate => _get('attemptDate');
  String get noDateMsg => _get('noDateMsg');
  String get uploadSkillProfileMsg => _get('uploadSkillProfile');
  String get addAttempt => _get('addAttempt');
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
