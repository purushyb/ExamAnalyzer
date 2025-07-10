import 'package:exam_analyzer/ui/attempts/viewmodels/attempt_detail_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/data_tile_widget.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';

class AttemptDetailScreen extends StatelessWidget {
  const AttemptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold<AttemptDetailViewmodel>(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).attemptDetailScreenTitle),
      ),
      childBuilder: (viewModel) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataTileWidget(
                  name: AppLocalization.of(context).overall(""),
                  value: viewModel.overallScore,
                ),
                DataTileWidget(
                  name: AppLocalization.of(context).examDateTitle,
                  value: viewModel.readbleDateFormat,
                ),
              ],
            ),
            const SizedBox(height: 12),
            SubSkillBreakDownWidget(
              title: AppLocalization.of(context).subSkillBreakDown,
              subskills: viewModel.mainSkills,
            ),
            SizedBox(height: 16),
            SubSkillBreakDownWidget(
              title: AppLocalization.of(context).subSkillBreakDown,
              subskills: viewModel.subSkills,
            ),
          ],
        );
      },
    );
  }
}
