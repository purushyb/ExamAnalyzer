import 'package:exam_analyzer/data/services/audio_service/i_audio_service.dart';
import 'package:flutter/material.dart';

class PitchViewModel extends ChangeNotifier {
  final IAudioService _service;

  List<double> _pitches = [];
  List<double> get pitches => _pitches;

  PitchViewModel(this._service) {
    _init();
  }

  void _init() {
    _service.pitchStream.listen((pitch) {
      _pitches.add(pitch);
      if (_pitches.length > 100) {
        _pitches.removeAt(0); // keep buffer small
      }
      notifyListeners();
    });

    _service.start();
  }

  @override
  void dispose() {
    _service.stop();
    super.dispose();
  }
}
