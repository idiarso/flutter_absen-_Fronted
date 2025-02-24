import '../../data/source/learning_api_service.dart';
import '../../data/providers/learning_provider.dart';

class LearningSubmitActivityUseCase {
  final LearningProvider _provider;

  LearningSubmitActivityUseCase(this._provider);

  Future<void> call(LearningActivity activity) async {
    await _provider.submitActivity(activity.toJson());
  }
}
