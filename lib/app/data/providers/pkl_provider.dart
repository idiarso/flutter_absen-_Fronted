import 'package:dio/dio.dart';
import '../models/jurnal_pkl_model.dart';
import '../source/pkl_api_service.dart';

class PKLProvider {
  final PKLApiService _apiService;

  PKLProvider(this._apiService);

  Future<List<Map<String, dynamic>>> getLocations() async {
    try {
      return await _apiService.getLocations();
    } catch (e) {
      throw 'Gagal mendapatkan data lokasi PKL: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>> getStudentPKL() async {
    try {
      return await _apiService.getStudentPKL();
    } catch (e) {
      throw 'Gagal mendapatkan data PKL siswa: ${e.toString()}';
    }
  }

  Future<void> submitDailyReport(JurnalPKL jurnal) async {
    try {
      await _apiService.submitDailyReport(jurnal);
    } catch (e) {
      throw 'Gagal mengirim laporan harian: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>> getProgress() async {
    try {
      return await _apiService.getProgress();
    } catch (e) {
      throw 'Gagal mendapatkan progress PKL: ${e.toString()}';
    }
  }
}
