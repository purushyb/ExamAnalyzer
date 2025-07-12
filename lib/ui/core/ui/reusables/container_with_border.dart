import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  const ContainerWithBorder({
    super.key,
    required this.child,
    this.padding,
    this.width,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      ),
      padding: padding,
      width: width,
      child: child,
    );
  }
}
