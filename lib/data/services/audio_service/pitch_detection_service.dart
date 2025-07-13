import 'dart:async';
import 'dart:typed_data';
import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

import 'i_audio_service.dart';

class PitchDetectionService implements IAudioService {
  final FlutterAudioCapture _audioCapture = FlutterAudioCapture();
  final PitchDetector _pitchDetector = PitchDetector(
    audioSampleRate: 44100,
    bufferSize: 2048,
  );
  final StreamController<double> _pitchController =
      StreamController<double>.broadcast();
  final StreamController<Float32List> _audioDataController =
      StreamController<Float32List>();

  @override
  Stream<double> get pitchStream => _pitchController.stream;

  final ILoggingService _logger;
  PitchDetectionService(this._logger) {

    _logger.info("constructor called");
    init();
  }

  Future<void> init() async {
    _logger.info("Started initializing");
    try {
      await _audioCapture.init();
    } catch (e) {
      _logger.error(msg: "error initializing audio", e: e);
    }
  }

  @override
  Future<void> start() async {
    _audioDataController.stream.listen(_processAudioData);
    await _audioCapture.start(
      _onAudio,
      _onError,
      sampleRate: 44100,
      bufferSize: 2048,
    );
  }

  Future<void> _processAudioData(Float32List data) async {
    final buffer = Float32List.view(data.buffer);
    final floatData = buffer.map((e) => e.toDouble()).toList();
    final result = await _pitchDetector.getPitchFromFloatBuffer(
      Float64List.fromList(floatData),
    );

    if (result.pitched && result.pitch > 50 && result.pitch < 1000) {
      _pitchController.add(result.pitch);
    }
  }

  void _onError(Object e) {
    print("Audio error: $e");
  }

  @override
  Future<void> stop() async {
    await _audioCapture.stop();
    await _pitchController.close();
    await _audioDataController.close();
  }

  void _onAudio(Float32List audioData) {
    _audioDataController.add(audioData);
  }
}
