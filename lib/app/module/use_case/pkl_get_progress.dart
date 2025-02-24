import '../../data/providers/pkl_provider.dart';
import '../../data/source/pkl_api_service.dart';

class PKLGetProgressUseCase {
  final PKLProvider _provider;

  PKLGetProgressUseCase(this._provider);

  Future<PKLProgress> call() async {
    return await _provider.getProgress();
  }
}
