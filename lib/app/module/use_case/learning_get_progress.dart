import '../../data/source/learning_api_service.dart';
import '../../data/providers/learning_provider.dart';

class LearningGetProgressUseCase {
  final LearningProvider _provider;

  LearningGetProgressUseCase(this._provider);

  Future<LearningProgress> call() async {
    return await _provider.getProgress();
  }
}
