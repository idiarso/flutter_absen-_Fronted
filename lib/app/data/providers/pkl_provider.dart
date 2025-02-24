import 'package:dio/dio.dart';
import '../models/jurnal_pkl_model.dart';
import '../source/pkl_api_service.dart';

class PKLProvider {
  final PKLApiService _apiService;

  PKLProvider(this._apiService);

  Future<List<JurnalPKL>> getJurnalList({
    String? search,
    String? status,
    String? startDate,
    String? endDate,
  }) async {
    try {
      return await _apiService.getJurnalList(
        search: search,
        status: status,
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      throw 'Gagal mendapatkan daftar jurnal: ${e.toString()}';
    }
  }

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

  Future<void> submitJurnal({
    required String kegiatan,
    required String lokasi,
    required List<int> dokumentasi,
    required String filename,
  }) async {
    try {
      await _apiService.submitJurnal(
        kegiatan: kegiatan,
        lokasi: lokasi,
        dokumentasi: dokumentasi,
        filename: filename,
      );
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

  Future<JurnalPKL> getJurnalDetail(int id) async {
    try {
      return await _apiService.getJurnalDetail(id);
    } catch (e) {
      throw 'Gagal mendapatkan detail jurnal: ${e.toString()}';
    }
  }

  Future<void> updateJurnalStatus(int id, String status, {String? catatan}) async {
    try {
      await _apiService.updateJurnalStatus(id, status, catatan);
    } catch (e) {
      throw 'Gagal mengupdate status jurnal: ${e.toString()}';
    }
  }
}
