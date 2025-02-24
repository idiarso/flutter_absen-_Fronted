import '../../data/providers/pkl_provider.dart';
import '../../data/source/pkl_api_service.dart';

class PKLGetStudentUseCase {
  final PKLProvider _provider;

  PKLGetStudentUseCase(this._provider);

  Future<PKLStudent> call() async {
    return await _provider.getStudentPKL();
  }
}
