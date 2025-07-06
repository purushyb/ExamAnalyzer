import 'package:exam_analyzer/data/models/score_report.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';

class SkillsBreakdownWidget extends StatelessWidget {
  final ScoreReport report;
  final int maxScore;

  const SkillsBreakdownWidget({
    super.key,
    required this.report,
    required this.maxScore,
  });

  @override
  Widget build(BuildContext context) {
    return SubSkillBreakDownWidget(
      title: AppLocalization.of(context).skillBreakdown,
      subskills: [
        Subskill(
          subskill: 0,
          skills: 0,
          name: AppLocalization.of(context).overall(""),
          description: "",
          score: report.gseScore,
          content: "",
        ),
        Subskill(
          subskill: 0,
          skills: 0,
          name: AppLocalization.of(context).speaking,
          description: "",
          score: report.speaking,
          content: "",
        ),
        Subskill(
          subskill: 0,
          skills: 0,
          name: AppLocalization.of(context).reading,
          description: "",
          score: report.reading,
          content: "",
        ),
        Subskill(
          subskill: 0,
          skills: 0,
          name: AppLocalization.of(context).writing,
          description: "",
          score: report.writing,
          content: "",
        ),
        Subskill(
          subskill: 0,
          skills: 0,
          name: AppLocalization.of(context).listening,
          description: "",
          score: report.listening,
          content: "",
        ),
      ],
    );
  }
}
