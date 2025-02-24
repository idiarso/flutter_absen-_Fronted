import '../source/dashboard_api_service.dart';

class DashboardProvider {
  final DashboardApiService _apiService;

  DashboardProvider(this._apiService);

  Future<Map<String, dynamic>> getSummary() async {
    try {
      return await _apiService.getSummary();
    } catch (e) {
      throw 'Gagal mendapatkan ringkasan dashboard: ${e.toString()}';
    }
  }

  Future<List<Map<String, dynamic>>> getRecentActivities() async {
    try {
      return await _apiService.getRecentActivities();
    } catch (e) {
      throw 'Gagal mendapatkan aktivitas terbaru: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>> getStatistics() async {
    try {
      return await _apiService.getStatistics();
    } catch (e) {
      throw 'Gagal mendapatkan statistik dashboard: ${e.toString()}';
    }
  }
}
