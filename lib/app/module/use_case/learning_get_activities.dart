import '../../data/models/learning_model.dart';
import '../../data/providers/learning_provider.dart';

class LearningGetActivitiesUseCase {
  final LearningProvider _provider;

  LearningGetActivitiesUseCase(this._provider);

  Future<List<LearningActivity>> call() async {
    final result = await _provider.getActivities();
    return result.map((e) => LearningActivity.fromJson(e)).toList();
  }
}
