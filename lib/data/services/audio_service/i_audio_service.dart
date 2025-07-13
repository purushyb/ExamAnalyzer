abstract class IAudioService {
  Stream<double> get pitchStream;
  Future<void> start();
  Future<void> stop();
}
