import '../../data/models/jurnal_pkl_model.dart';
import '../../data/providers/pkl_provider.dart';

class PKLSubmitDailyReportUseCase {
  final PKLProvider _provider;

  PKLSubmitDailyReportUseCase(this._provider);

  Future<void> call(JurnalPKL jurnal) async {
    await _provider.submitJurnal(
      kegiatan: jurnal.kegiatan,
      lokasi: jurnal.lokasi,
      dokumentasi: jurnal.dokumentasi,
      filename: jurnal.filename ?? 'dokumentasi.jpg',
    );
  }
}
