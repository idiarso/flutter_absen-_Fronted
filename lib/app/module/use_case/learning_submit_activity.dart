import '../../data/source/learning_api_service.dart';
import '../../data/repository/learning_repository.dart';
import '../../../core/data/data_state.dart';

class LearningSubmitActivityUseCase {
  final LearningRepository _repository;

  LearningSubmitActivityUseCase(this._repository);

  Future<DataState<void>> call(LearningActivity activity) async {
    return await _repository.submitActivity(activity);
  }
}
