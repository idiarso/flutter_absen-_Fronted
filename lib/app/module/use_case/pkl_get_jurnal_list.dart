import '../../data/models/jurnal_pkl_model.dart';
import '../../data/providers/pkl_provider.dart';

class PKLGetJurnalListUseCase {
  final PKLProvider _provider;

  PKLGetJurnalListUseCase(this._provider);

  Future<List<JurnalPKL>> execute({
    String? search,
    String? status,
    String? startDate,
    String? endDate,
  }) async {
    return await _provider.getJurnalList(
      search: search,
      status: status,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
