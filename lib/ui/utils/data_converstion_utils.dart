import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';

class DataConverstionUtils {
  static List<Subskill> mainSkillsToSubSkills(
    ScoreReport report,
    AppLocalization localization, {
    bool showOverall = true,
  }) {
    return [
      Subskill(
        subskill: 0,
        skills: 0,
        name: localization.overall(),
        description: "",
        score: report.gseScore,
        content: "",
      ),
      Subskill(
        subskill: 0,
        skills: 0,
        name: localization.speakingTitle,
        description: "",
        score: report.speaking,
        content: "",
      ),
      Subskill(
        subskill: 0,
        skills: 0,
        name: localization.readingTitle,
        description: "",
        score: report.reading,
        content: "",
      ),
      Subskill(
        subskill: 0,
        skills: 0,
        name: localization.writingTitle,
        description: "",
        score: report.writing,
        content: "",
      ),
      Subskill(
        subskill: 0,
        skills: 0,
        name: localization.listeningTitle,
        description: "",
        score: report.listening,
        content: "",
      ),
    ];
  }
}
