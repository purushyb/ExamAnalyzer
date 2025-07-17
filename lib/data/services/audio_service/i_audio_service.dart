import 'package:exam_analyzer/data/utils/result.dart';

abstract class IAudioService {
  Stream<double> get pitchStream;
  Future<Result<bool>> start();
  Future<void> stop();
}
