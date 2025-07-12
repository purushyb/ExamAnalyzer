import 'package:exam_analyzer/ui/core/ui/base_widget_padding.dart';
import 'package:flutter/material.dart';

class BaseWidgetToggleSwitch extends StatelessWidget {
  const BaseWidgetToggleSwitch({
    super.key,
    required this.isToggled,
    required this.widget1,
    required this.widget2,
    required this.toogleSwitch,
  });
  final bool isToggled;
  final Widget widget1;
  final Widget widget2;
  final Function(bool) toogleSwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BaseWidgetPadding(
          child: Switch(value: isToggled, onChanged: toogleSwitch),
        ),
        isToggled ? widget1 : widget2,
      ],
    );
  }
}
