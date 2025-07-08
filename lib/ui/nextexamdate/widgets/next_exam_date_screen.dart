import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/container_with_border.dart';
import 'package:exam_analyzer/ui/core/ui/padded_scaffold.dart';
import 'package:exam_analyzer/ui/nextexamdate/viewmodels/next_exam_date_viewmodel.dart';
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
    return PaddedScaffold<NextExamDateViewmodel>(
      title: AppLocalization.of(context).nextExamDateScreenTitle,
      childBuilder:
          (viewModel) => Column(
            children: [
              ContainerWithBorder(
                child: ListTile(
                  title: Text(AppLocalization.of(context).nextExamDate),
                  subtitle: Text(viewModel.nextExamDateRedableFormat),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () {
                    pickDate(
                      selectedDate: viewModel.nextExamDate,
                      onSuccess: (date) {
                        viewModel.selectDate(date);
                      },
                    );
                  },
                ),
              ),

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
                    viewModel.setNewExamDate();
                  },
                  child: Text(AppLocalization.of(context).setDate),
                ),
              ),
            ],
          ),
    );
  }
}
