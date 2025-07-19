import 'package:flutter/material.dart';

class RootAppBar extends StatefulWidget {
  const RootAppBar({super.key, required this.title});
  final String title;

  @override
  State<RootAppBar> createState() => _RootAppBarState();
}

class _RootAppBarState extends State<RootAppBar> {
  String _currentTitle = "";
  @override
  void didUpdateWidget(covariant RootAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      _currentTitle = widget.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(_currentTitle));
  }
}
