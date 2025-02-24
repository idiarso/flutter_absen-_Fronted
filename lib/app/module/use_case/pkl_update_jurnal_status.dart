import '../../data/providers/pkl_provider.dart';

class PKLUpdateJurnalStatusUseCase {
  final PKLProvider _provider;

  PKLUpdateJurnalStatusUseCase(this._provider);

  Future<void> call(int id, String status, {String? catatan}) async {
    await _provider.updateJurnalStatus(id, status, catatan: catatan);
  }
}
