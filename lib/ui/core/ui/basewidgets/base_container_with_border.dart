import 'package:flutter/material.dart';

class BaseContainerWithBorder extends StatelessWidget {
  const BaseContainerWithBorder({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.constraints,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
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
