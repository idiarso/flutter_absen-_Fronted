import '../../data/source/learning_api_service.dart';
import '../../data/repository/learning_repository.dart';
import '../../../core/data/data_state.dart';

class LearningGetActivitiesUseCase {
  final LearningRepository _repository;

  LearningGetActivitiesUseCase(this._repository);

  Future<DataState<List<LearningActivity>>> call() async {
    return await _repository.getActivities();
  }
}
