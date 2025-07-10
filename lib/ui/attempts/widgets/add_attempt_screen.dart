import 'package:exam_analyzer/ui/attempts/viewmodels/add_attempt_viewmodel.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/container_with_border.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:exam_analyzer/ui/core/ui/sub_skill_break_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  Future<void> pickDate({
    DateTime? selectedDate,
    required Function(DateTime) onSuccess,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(2020),
      lastDate: now,
    );
    if (picked != null) {
      onSuccess(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold<AddAttemptViewmodel>(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).addAttemptsScreenTitle),
      ),
      childBuilder:
          (viewModel) => Column(
            children: [
              ContainerWithBorder(
                child: ListTile(
                  title: Text(AppLocalization.of(context).attemptDate),
                  subtitle: Text(
                    viewModel.date != null
                        ? DateFormat.yMMMMd().format(viewModel.date!)
                        : AppLocalization.of(context).noDateMsg,
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () {
                    pickDate(
                      selectedDate: viewModel.date,
                      onSuccess: (date) {
                        viewModel.selectDate(date);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ContainerWithBorder(
                child: ListTile(
                  leading: const Icon(Icons.upload_file),
                  title: Text(
                    AppLocalization.of(context).uploadSkillProfileMsg,
                  ),
                  onTap: () {
                    pickJsonFile(
                      onSuccess: (path) {
                        viewModel.parseReport(path);
                      },
                    );
                  },
                ),
              ),

              viewModel.mainSkills.isNotEmpty
                  ? Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: SubSkillBreakDownWidget(
                      title: AppLocalization.of(context).subSkillBreakDown,
                      subskills: viewModel.mainSkills,
                    ),
                  )
                  : SizedBox(),

              if (viewModel.error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    viewModel.error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const Spacer(),
              ContainerWithBorder(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.addAttempt();
                  },
                  child: Text(AppLocalization.of(context).addAttempt),
                ),
              ),
            ],
          ),
    );
  }
}
