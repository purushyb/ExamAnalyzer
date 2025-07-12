import 'package:exam_analyzer/data/enums/main_skills_enum.dart';
import 'package:exam_analyzer/ui/attempts/viewmodels/add_attempt_viewmodel.dart';
import 'package:exam_analyzer/ui/attempts/widgets/input_text_Field.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/base_big_button_widget.dart';
import 'package:exam_analyzer/ui/core/ui/base_date_picker_widget.dart';
import 'package:exam_analyzer/ui/core/ui/base_upload_widget.dart';
import 'package:exam_analyzer/ui/core/ui/base_widget_toggle_switch.dart';
import 'package:exam_analyzer/ui/core/ui/base_view.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
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
                BaseWidgetToggleSwitch(
                  isToggled: viewModel.isManualSkillAddition,
                  widget1: ManualSkillAdditionWidget(
                    onChanged: viewModel.updateScore,
                  ),
                  widget2: BaseUploadWidget(
                    label: AppLocalization.of(context).uploadSkillProfileMsg,
                    onFilePicked: viewModel.parseReport,
                  ),
                  toogleSwitch: viewModel.toggleSkillAddition,
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
          label: AppLocalization.of(context).speaking,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.reading),
          label: AppLocalization.of(context).reading,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.writing),
          label: AppLocalization.of(context).writing,
        ),
        InputTextField(
          onChanged:
              (userInput) => onChanged(userInput, MainSkillsEnum.listening),
          label: AppLocalization.of(context).listening,
        ),
      ],
    );
  }
}
