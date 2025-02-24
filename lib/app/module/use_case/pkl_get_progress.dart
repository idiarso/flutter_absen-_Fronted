import '../../data/providers/pkl_provider.dart';

class PKLGetProgressUseCase {
  final PKLProvider _provider;

  PKLGetProgressUseCase(this._provider);

  Future<Map<String, dynamic>> call() async {
    return await _provider.getProgress();
  }
}
