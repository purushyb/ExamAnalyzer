import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_big_button_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_date_picker_widget.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_view.dart';
import 'package:exam_analyzer/ui/next_exam_date/viewmodels/next_exam_date_viewmodel.dart';
import 'package:flutter/material.dart';

class NextExamDateScreen extends StatefulWidget {
  const NextExamDateScreen({super.key});

  @override
  State<NextExamDateScreen> createState() => _NextExamDateScreenState();
}

class _NextExamDateScreenState extends State<NextExamDateScreen> {
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
    return BaseView<NextExamDateViewmodel>(
      appBarBuilder:
          (viewModel) => AppBar(
            title: Text(AppLocalization.of(context).nextExamDateScreenTitle),
          ),
      childBuilder:
          (viewModel) => Column(
            children: [
              BaseDatePickerWidget(
                endDate: viewModel.futureDateLimit,
                currentDate: viewModel.nextExamDate,
                label: AppLocalization.of(context).nextExamDate,
                onDatePicked: viewModel.selectDate,
              ),
              BaseBigButtonWidget(
                onPressed: () {
                  viewModel.setNewExamDate();
                },
                label: AppLocalization.of(context).setDate,
              ),
            ],
          ),
    );
  }
}
