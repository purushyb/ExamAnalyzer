import 'package:exam_analyzer/data/enums/main_skills_enum.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/add_attempt_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/input_text_Field.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_big_button_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_date_picker_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_upload_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_toggle_switch_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddAttemptScreen extends StatefulWidget {
  const AddAttemptScreen({super.key});

  @override
  State<AddAttemptScreen> createState() => _AddAttemptScreenState();
}

class _AddAttemptScreenState extends State<AddAttemptScreen> {
  Future<void> pickJsonFile({required Function(String) onSuccess}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    if (result != null && result.files.single.path != null) {
      onSuccess(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AddAttemptViewmodel>(
      padding: EdgeInsets.all(0),
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).addAttemptsScreenTitle),
          ),
      childBuilder:
          (viewModel) => SingleChildScrollView(
            child: Column(
              children: [
                BaseDatePickerWidget(
                  endDate: viewModel.endDate,
                  startDate: viewModel.startDate,
                  label: AppLocalization.of(context).attemptDate,
                  currentDate: viewModel.date,
                  onDatePicked: viewModel.selectDate,
                ),
                BaseToggleSwitchWidget(
                  isToggled: viewModel.isManualSkillAddition,
                  widget1: ManualSkillAdditionWidget(
                    onChanged: viewModel.updateScore,
                  ),
                  widget2: BaseUploadWidget(
                    label: AppLocalization.of(context).uploadSkillProfileMsg,
                    onFilePicked: viewModel.parseReport,
                  ),
                  onChanged: viewModel.toggleSkillAddition,
                ),

                viewModel.mainSkills.isNotEmpty
                    ? SubSkillBreakDownWidget(
                      title: AppLocalization.of(context).subSkillBreakDown,
                      subskills: viewModel.mainSkills,
                    )
                    : SizedBox(),
                BaseBigButtonWidget(
                  onPressed: viewModel.addAttempt,
                  label: AppLocalization.of(context).addAttempt,
                ),
              ],
            ),
          ),
    );
  }
}

class ManualSkillAdditionWidget extends StatelessWidget {
  const ManualSkillAdditionWidget({super.key, required this.onChanged});
  final Function(String, MainSkillsEnum) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.overall),
          label: AppLocalization.of(context).overall(),
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.speaking),
          label: AppLocalization.of(context).speakingTitle,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.reading),
          label: AppLocalization.of(context).readingTitle,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.writing),
          label: AppLocalization.of(context).writingTitle,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.listening),
          label: AppLocalization.of(context).listeningTitle,
        ),
      ],
    );
  }
}
