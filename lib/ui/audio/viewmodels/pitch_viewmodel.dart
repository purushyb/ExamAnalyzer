import 'dart:async';

import 'package:exam_analyzer/data/services/audio_service/i_audio_service.dart';
import 'package:flutter/material.dart';

class PitchViewModel extends ChangeNotifier {
  final IAudioService _service;

  final List<double> _pitches = [];
  List<double> get pitches => _pitches;

  late final StreamSubscription _subscription;
  PitchViewModel(this._service) {
    _init();
  }

  void _init() {
    _subscription = _service.pitchStream.listen((pitch) {
      _pitches.add(pitch);
      if (_pitches.length > 20) {
        _pitches.removeAt(0); // keep buffer small
      }
      notifyListeners();
    });

    _service.start();
  }

  @override
  void dispose() {
    _service.stop();
    _subscription.cancel();
    super.dispose();
  }
}
