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
    await _audioCapture.start(
      _processAudioData,
      _onError,
      sampleRate: 44100,
      bufferSize: 2048,
    );
  }

  void _onError(Object e) {
    _logger.error(msg: "Audio error: ", e: e);
  }

  Future<void> _processAudioData(Float32List data) async {
    final floatData = data.map((e) => e.toDouble()).toList();
    final result = await _pitchDetector.getPitchFromFloatBuffer(
      Float32List.fromList(floatData),
    );

    if (result.pitched && result.pitch > 50 && result.pitch < 1000) {
      _pitchController.add(result.pitch);
    } else {
      _logger.error(msg: "Not sending data");
    }
  }

  @override
  Future<void> stop() async {
    await _audioCapture.stop();
  }
}
