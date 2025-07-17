import 'dart:async';
import 'package:exam_analyzer/data/services/audio_service/i_audio_service.dart';
import 'package:exam_analyzer/ui/core/viewmodel.dart/base_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';

class PitchScreenViewModel extends BaseViewModel {
  final IAudioService _service;
  final List<double> _pitches = [];

  static const int _maxBufferSize = 20;
  StreamSubscription<double>? _subscription;

  PitchScreenViewModel(this._service) {
    init();
  }

  List<FlSpot> get pitchSpots =>
      List.generate(_pitches.length, (i) => FlSpot(i.toDouble(), _pitches[i]));

  @override
  Future<void> init() async {
    if (_subscription != null) return; // prevent multiple inits

    _subscription = _service.pitchStream.listen(
      (pitch) {
        _pitches.add(pitch);
        if (_pitches.length > _maxBufferSize) {
          _pitches.removeAt(0);
        }

        notifyListeners();
      },
      onError: (e) {
        setError("Audio stream error");
      },
    );

    final result = await _service.start();
    if (result.isFailure) {
      setError(result.error);
    }
  }

  @override
  void dispose() {
    _service.stop();
    _subscription?.cancel();
    _subscription = null;
    super.dispose();
  }
}
