import 'package:exam_analyzer/data/utils/ux_simplification_utils.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:exam_analyzer/ui/core/ui/reusables/container_with_border.dart';
import 'package:flutter/material.dart';

class BaseDatePickerWidget extends StatefulWidget {
  const BaseDatePickerWidget({
    super.key,
    required this.endDate,
    required this.label,
    this.currentDate,
    required this.onDatePicked,
    this.startDate,
  });
  final String label;
  final DateTime? currentDate;
  final DateTime? startDate;
  final DateTime endDate;
  final Function(DateTime) onDatePicked;

  @override
  State<BaseDatePickerWidget> createState() => _BaseDatePickerWidgetState();
}

class _BaseDatePickerWidgetState extends State<BaseDatePickerWidget> {
  Future<void> pickDate({
    DateTime? selectedDate,
    required Function(DateTime) onSuccess,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: widget.startDate ?? now,
      lastDate: widget.endDate,
    );
    if (picked != null) {
      onSuccess(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePaddingWidget(
      child: ListTile(
        title: Text(widget.label),
        subtitle: Text(
          widget.currentDate != null
              ? widget.currentDate!.readableDate()
              : AppLocalization.of(context).noDateMsg,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        trailing: const Icon(Icons.calendar_today),
        onTap: () {
          pickDate(
            selectedDate: widget.currentDate,
            onSuccess: widget.onDatePicked,
          );
        },
      ),
    );
  }
}
