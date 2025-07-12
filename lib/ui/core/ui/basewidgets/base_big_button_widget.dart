import 'package:flutter/material.dart';

class BaseBigButtonWidget extends StatelessWidget {
  const BaseBigButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(onPressed: onPressed, child: Text(label)),
      ),
    );
  }
}
