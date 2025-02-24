import '../../data/models/jurnal_pkl_model.dart';
import '../../data/providers/pkl_provider.dart';

class PKLGetJurnalDetailUseCase {
  final PKLProvider _provider;

  PKLGetJurnalDetailUseCase(this._provider);

  Future<JurnalPKL> call(int id) async {
    return await _provider.getJurnalDetail(id);
  }
}
