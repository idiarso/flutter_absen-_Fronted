import '../../data/source/learning_api_service.dart';
import '../../data/repository/learning_repository.dart';
import '../../../core/data/data_state.dart';

class LearningGetProgressUseCase {
  final LearningRepository _repository;

  LearningGetProgressUseCase(this._repository);

  Future<DataState<LearningProgress>> call() async {
    return await _repository.getProgress();
  }
}
