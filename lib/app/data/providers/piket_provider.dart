import '../models/piket_model.dart';
import '../source/piket_api_service.dart';

class PiketProvider {
  final PiketApiService _apiService;

  PiketProvider(this._apiService);

  // Schedule Methods
  Future<List<PiketSchedule>> getSchedule() async {
    try {
      return await _apiService.getSchedule();
    } catch (e) {
      throw 'Gagal mendapatkan jadwal piket: ${e.toString()}';
    }
  }

  Future<List<PiketSchedule>> getMySchedule() async {
    try {
      return await _apiService.getMySchedule();
    } catch (e) {
      throw 'Gagal mendapatkan jadwal piket anda: ${e.toString()}';
    }
  }

  Future<void> createSchedule(PiketSchedule schedule) async {
    try {
      await _apiService.createSchedule(schedule);
    } catch (e) {
      throw 'Gagal membuat jadwal piket: ${e.toString()}';
    }
  }

  Future<void> updateSchedule(int id, PiketSchedule schedule) async {
    try {
      await _apiService.updateSchedule(id, schedule);
    } catch (e) {
      throw 'Gagal mengupdate jadwal piket: ${e.toString()}';
    }
  }

  Future<void> deleteSchedule(int id) async {
    try {
      await _apiService.deleteSchedule(id);
    } catch (e) {
      throw 'Gagal menghapus jadwal piket: ${e.toString()}';
    }
  }

  // Activity Methods
  Future<List<PiketActivity>> getActivities({
    String? startDate,
    String? endDate,
    String? status,
  }) async {
    try {
      return await _apiService.getActivities(
        startDate: startDate,
        endDate: endDate,
        status: status,
      );
    } catch (e) {
      throw 'Gagal mendapatkan aktivitas piket: ${e.toString()}';
    }
  }

  Future<void> createActivity({
    required String activity,
    required String status,
    List<int>? documentation,
    String? filename,
    String? notes,
  }) async {
    try {
      await _apiService.createActivity(
        activity: activity,
        status: status,
        documentation: documentation,
        filename: filename,
        notes: notes,
      );
    } catch (e) {
      throw 'Gagal membuat aktivitas piket: ${e.toString()}';
    }
  }

  Future<void> updateActivity(int id, PiketActivity activity) async {
    try {
      await _apiService.updateActivity(id, activity);
    } catch (e) {
      throw 'Gagal mengupdate aktivitas piket: ${e.toString()}';
    }
  }

  Future<void> deleteActivity(int id) async {
    try {
      await _apiService.deleteActivity(id);
    } catch (e) {
      throw 'Gagal menghapus aktivitas piket: ${e.toString()}';
    }
  }

  // Report Methods
  Future<List<PiketReport>> getReports({
    String? startDate,
    String? endDate,
  }) async {
    try {
      return await _apiService.getReports(
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      throw 'Gagal mendapatkan laporan piket: ${e.toString()}';
    }
  }

  Future<PiketReport> getReportDetail(int id) async {
    try {
      return await _apiService.getReportDetail(id);
    } catch (e) {
      throw 'Gagal mendapatkan detail laporan piket: ${e.toString()}';
    }
  }

  Future<PiketReport> generateReport({
    required String startDate,
    required String endDate,
  }) async {
    try {
      return await _apiService.generateReport(
        startDate: startDate,
        endDate: endDate,
      );
    } catch (e) {
      throw 'Gagal membuat laporan piket: ${e.toString()}';
    }
  }
}
