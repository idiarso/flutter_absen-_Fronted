import '../../data/providers/pkl_provider.dart';

class PKLUpdateJurnalStatusUseCase {
  final PKLProvider _provider;

  PKLUpdateJurnalStatusUseCase(this._provider);

  Future<void> execute(int id, String status, {String? catatan}) async {
    await _provider.updateJurnalStatus(id, status, catatan: catatan);
  }
}
