import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static const _strings = <String, String>{
    'dashboardScreenTitle': "Analytics",
    'attemptsListScreenTitle': "Attempts",
    'addAttemptsScreenTitle': "Add Attempt",
    'attemptDetailScreenTitle': "Attempt Detail",
    'nextExamDateScreenTitle': "Next Exam Date",
    'realTimePitchScreenTitle': "Real-time Pitch",
    'settingsScreenTitle': "Settings",
    'examDateTitle': "Exam Date",
    'attempts': "Attempts",
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
    'somethingWentWrong': "Something went wrong",
    'setDate': "Set Date",
    'nextExamDate': "Next Exam Date",
    'reportsErrorMsg': "Failed to fetch reports",
    'examDateErrorMsg': "Failed to fetch exam date",
    'reportErrorMsg': "Failed to fetch report",
    'deleteReportErrorMsg': "Failed to delete report",
    'updateReportErrorMsg': "Failed to update report",
    'addReportErrorMsg': "Failed to add report",
    'addExamDateErrorMsg': "Failed to add exam date",
    'dateNotAssignedError': "Date should be selected",
    'noSubskillsMsg': "No subskills added",
    'dateTitle': "Date",
    'gseScoreTitle': "GSE Score",
    'subSkillTitle': "Subskill {value}",
    'mainSkillBreakdownTitle': "Main skill breakdown",
    'couldNotLaunch': "Cound not launch {value}",
    'addNotesErrMsg': "Unable to add notes",
    'addNotesTitle': "Link Notes",
    'checkPitchTitle': "Check Pitch",
    'dndTitle': "DND",
    'addALinkTitle': "Add a link",
    'submitLinkTitle': "Submit link",
    'noNotesErrMsg': "Notes not linked, link it in settings",
    'retry': "Retry",
    'microphonePermissionError': "Microphone permission not granted",
    'themeTitle': "Theme"
  };

  // If string for "label" does not exist, will show "[LABEL]"
  static String _get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  // TODO: have to find a better way to do this
  // Should only be used for getting Appbar title
  static String get(String label) =>
      _strings[label] ?? '[${label.toUpperCase()}]';

  String get dashboardScreenTitle => _get('dashboardScreenTitle');
  String get attemptsListScreenTitle => _get('attemptsListScreenTitle');
  String get addAttemptsScreenTitle => _get('addAttemptsScreenTitle');
  String get attemptDetailScreenTitle => _get('attemptDetailScreenTitle');
  String get nextExamDateScreenTitle => _get('nextExamDateScreenTitle');
  String realTimePitchScreenTitle = _get('realTimePitchScreenTitle');
  String get scoreTrendTitle => _get('scoreTrend');
  String get attemptsTitle => _get('attempts');
  String get examDateTitle => _get('examDateTitle');
  String get speakingTitle => _get('speaking');
  String get readingTitle => _get('reading');
  String get writingTitle => _get('writing');
  String get listeningTitle => _get('listening');
  String get dateTitle => _get('dateTitle');
  String get gseScoreTitle => _get('gseScoreTitle');
  String subSkillTitle({String value = ""}) =>
      _get('subSkillTitle').replaceAll('{value}', value);
  String get skillBreakdown => _get('skillBreakdown');
  String overall({String value = ""}) =>
      _get('overall').replaceAll('{value}', value);
  String get subSkillBreakDown => _get('subSkillBreakdown');
  String get attemptDate => _get('attemptDate');
  String get noDateMsg => _get('noDateMsg');
  String get uploadSkillProfileMsg => _get('uploadSkillProfile');
  String get addAttempt => _get('addAttempt');
  String get somethingWentWrong => _get('somethingWentWrong');
  String get setDate => _get('setDate');
  String get nextExamDate => _get('nextExamDate');
  String get reportsErrorMsg => _get('reportsErrorMsg');
  String get examDateErrorMsg => _get('examDateErrorMsg');
  String get addExamDateErrorMsg => _get('addExamDateErrorMsg');
  String get reportErrorMsg => _get("reportErrorMsg");
  String get addReportErrorMsg => _get("addReportErrorMsg");
  String get deleteReportErrorMsg => _get("deleteReportErrorMsg");
  String get updateReportErrorMsg => _get("updateReportErrorMsg");
  String get dateNotAssignedError => _get("dateNotAssignedError");
  String get noSubskillsMsg => _get("noSubskillsMsg");
  String get mainSkillBreakdownTitle => _get("mainSkillBreakdownTitle");
  String couldNotLaunch({String url = "url"}) =>
      _get("couldNotLaunch").replaceAll("{value}", url);
  String addNotesErrMsg = _get("addNotesErrMsg");
  String addNotesTitle = _get("addNotesTitle");
  String checkPitchTitle = _get("checkPitchTitle");
  String dndTitle = _get("dndTitle");
  String addALinkTitle = _get("addALinkTitle");
  String submitLinkTitle = _get("submitLinkTitle");
  String noNotesErrMsg = _get('noNotesErrMsg');
  String retryTitle = _get('retry');
  String microphonePermissionError = _get('microphonePermissionError');
  String settingsScreenTitle = _get('settingsScreenTitle');
  String themeTitle = _get("themeTitle");
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
