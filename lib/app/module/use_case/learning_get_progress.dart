import '../../data/models/learning_model.dart';
import '../../data/providers/learning_provider.dart';

class LearningGetProgressUseCase {
  final LearningProvider _provider;

  LearningGetProgressUseCase(this._provider);

  Future<LearningProgress> call() async {
    final result = await _provider.getProgress();
    return LearningProgress.fromJson(result);
  }
}
