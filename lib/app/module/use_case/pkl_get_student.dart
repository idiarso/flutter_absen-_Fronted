import '../../data/providers/pkl_provider.dart';

class PKLGetStudentUseCase {
  final PKLProvider _provider;

  PKLGetStudentUseCase(this._provider);

  Future<Map<String, dynamic>> call() async {
    return await _provider.getStudentPKL();
  }
}
