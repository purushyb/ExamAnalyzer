import 'dart:async';
import 'dart:typed_data';
import 'package:exam_analyzer/data/services/logging_service/i_logging_service.dart';
import 'package:exam_analyzer/data/utils/result.dart';
import 'package:exam_analyzer/ui/core/loacalization/app_localization.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

import 'i_audio_service.dart';

class PitchDetectionService implements IAudioService {
  final int _sampleRate = 44100;
  final int _bufferSize = 2048;
  final FlutterAudioCapture _audioCapture = FlutterAudioCapture();
  late final PitchDetector _pitchDetector;
  final StreamController<double> _pitchController =
      StreamController<double>.broadcast();

  @override
  Stream<double> get pitchStream => _pitchController.stream;

  final ILoggingService _logger;
  final AppLocalization _localization;
  PitchDetectionService(this._logger, this._localization) {
    _pitchDetector = PitchDetector(
      audioSampleRate: _sampleRate.toDouble(),
      bufferSize: _bufferSize,
    );
    init();
  }

  Future<void> init() async {
    try {
      await _audioCapture.init();
    } catch (e) {
      _logger.error(msg: "error initializing audio", e: e);
    }
  }

  @override
  Future<Result<bool>> start() async {
    final granted = await Permission.microphone.request();
    if (!granted.isGranted) {
      _logger.error(msg: _localization.microphonePermissionError);
      return Result.failure(_localization.microphonePermissionError);
    }
    await _audioCapture.start(
      _processAudioData,
      _onError,
      sampleRate: _sampleRate,
      bufferSize: _bufferSize,
    );
    return Result.success(true);
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
    }
  }

  @override
  Future<void> stop() async {
    await _audioCapture.stop();
  }
}
