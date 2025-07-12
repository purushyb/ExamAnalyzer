import 'package:flutter/material.dart';

class BasePaddingWidget extends StatelessWidget {
  const BasePaddingWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: child,
    );
  }
}
