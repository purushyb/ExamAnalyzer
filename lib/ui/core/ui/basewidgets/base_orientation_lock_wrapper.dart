import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum OrientationLock { portrait, landscape }

class BaseOrientationLockWrapper extends StatefulWidget {
  final Widget child;
  final OrientationLock lock;

  const BaseOrientationLockWrapper({
    super.key,
    required this.child,
    required this.lock,
  });

  @override
  State<BaseOrientationLockWrapper> createState() =>
      _BaseOrientationLockWrapperState();
}

class _BaseOrientationLockWrapperState
    extends State<BaseOrientationLockWrapper> {
  @override
  void initState() {
    super.initState();
    _lockOrientation();
  }

  void _lockOrientation() {
    switch (widget.lock) {
      case OrientationLock.portrait:
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        break;
      case OrientationLock.landscape:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        break;
    }
  }

  @override
  void dispose() {
    // Restore all orientations when leaving
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
