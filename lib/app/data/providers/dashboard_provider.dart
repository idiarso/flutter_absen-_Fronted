import '../source/dashboard_api_service.dart';

class DashboardProvider {
  final DashboardApiService _apiService;

  DashboardProvider(this._apiService);

  Future<Map<String, dynamic>> getSummary() async {
    try {
      final summary = await _apiService.getSummary();
      return summary is Map<String, dynamic> 
          ? summary as Map<String, dynamic>
          : {'data': summary};
    } catch (e) {
      throw 'Gagal mendapatkan ringkasan dashboard: ${e.toString()}';
    }
  }

  Future<List<Map<String, dynamic>>> getRecentActivities() async {
    try {
      final activities = await _apiService.getRecentActivities();
      return activities.map<Map<String, dynamic>>((activity) => 
          activity is Map<String, dynamic> 
              ? activity as Map<String, dynamic>
              : {'data': activity}
      ).toList();
    } catch (e) {
      throw 'Gagal mendapatkan aktivitas terbaru: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>> getStatistics() async {
    try {
      final stats = await _apiService.getStatistics();
      return stats is Map<String, dynamic> 
          ? stats as Map<String, dynamic>
          : {'data': stats};
    } catch (e) {
      throw 'Gagal mendapatkan statistik dashboard: ${e.toString()}';
    }
  }
}
