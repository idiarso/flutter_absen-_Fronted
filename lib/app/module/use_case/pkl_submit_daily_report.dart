import '../../data/models/jurnal_pkl_model.dart';
import '../../data/providers/pkl_provider.dart';

class PKLSubmitDailyReportUseCase {
  final PKLProvider _provider;

  PKLSubmitDailyReportUseCase(this._provider);

  Future<void> call(JurnalPKL jurnal) async {
    await _provider.submitDailyReport(jurnal);
  }
}
