import 'package:exam_analyzer/ui/core/ui/basewidgets/base_orientation_lock_wrapper.dart';
import 'package:flutter/material.dart';

class GenericFullScreen extends StatelessWidget {
  final Widget child;

  const GenericFullScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BaseOrientationLockWrapper(
      lock: OrientationLock.landscape,
      child: Scaffold(
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(16.0), child: child),
        ),
      ),
    );
  }
}
