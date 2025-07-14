import 'dart:async';

import 'package:exam_analyzer/data/services/audio_service/i_audio_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';

class PitchScreenViewModel extends BaseViewModel {
  final IAudioService _service;

  final List<double> _pitches = [];
  List<FlSpot> get pitches =>
      _pitches
          .asMap()
          .entries
          .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
          .toList();

  late final StreamSubscription _subscription;
  PitchScreenViewModel(this._service) {
    init();
  }

  @override
  Future<void> init() async {
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
