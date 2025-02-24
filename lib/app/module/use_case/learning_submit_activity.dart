import '../../data/models/learning_model.dart';
import '../../data/providers/learning_provider.dart';

class LearningSubmitActivityUseCase {
  final LearningProvider _provider;

  LearningSubmitActivityUseCase(this._provider);

  Future<void> call(LearningActivity activity) async {
    await _provider.submitActivity(activity.toJson());
  }
}
