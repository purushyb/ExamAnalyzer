import 'package:exam_analyzer/ui/core/ui/basewidgets/base_padding_widget.dart';
import 'package:flutter/material.dart';

class BaseToggleSwitchWidget extends StatelessWidget {
  const BaseToggleSwitchWidget({
    super.key,
    required this.isToggled,
    required this.widget1,
    required this.widget2,
    required this.onChanged,
  });
  final bool isToggled;
  final Widget widget1;
  final Widget widget2;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BasePaddingWidget(
          child: Switch(value: isToggled, onChanged: onChanged),
        ),
        isToggled ? widget1 : widget2,
      ],
    );
  }
}
