import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:exam_analyzer/ui/core/ui/skill_breakdown_widget.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
import 'package:exam_analyzer/ui/utils/charts_utils.dart';
import 'package:flutter/material.dart';

class AttemptDetailScreen extends StatelessWidget {
  const AttemptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold<AttemptDetailViewmodel>(
      title: AppLocalization.of(context).attemptDetailScreenTitle,
      childBuilder: (viewModel) {
        if (viewModel.attempt != null) {
          return ListView(
            children: [
              const SizedBox(height: 12),
              SkillsBreakdownWidget(
                report: viewModel.attempt!,
                maxScore: ChartUtils.maxScore,
              ),
              SizedBox(height: 16),
              SubSkillBreakDownWidget(
                title: AppLocalization.of(context).subSkillBreakDown,
                subskills: viewModel.attempt!.subskills,
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
