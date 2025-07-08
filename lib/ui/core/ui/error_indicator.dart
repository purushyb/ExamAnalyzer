import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? AppLocalization.of(context).somethingWentWrong),
    );
  }
}
