import '../../data/source/learning_api_service.dart';
import '../../data/providers/learning_provider.dart';

class LearningGetActivitiesUseCase {
  final LearningProvider _provider;

  LearningGetActivitiesUseCase(this._provider);

  Future<List<LearningActivity>> call() async {
    return await _provider.getActivities();
  }
}
