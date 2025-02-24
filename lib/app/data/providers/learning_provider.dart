import '../source/learning_api_service.dart';

class LearningProvider {
  final LearningApiService _apiService;

  LearningProvider(this._apiService);

  Future<List<LearningActivity>> getActivities() async {
    try {
      return await _apiService.getActivities();
    } catch (e) {
      throw 'Gagal mendapatkan data aktivitas pembelajaran: ${e.toString()}';
    }
  }

  Future<LearningProgress> getProgress() async {
    try {
      return await _apiService.getProgress();
    } catch (e) {
      throw 'Gagal mendapatkan progress pembelajaran: ${e.toString()}';
    }
  }

  Future<void> submitActivity(Map<String, dynamic> data) async {
    try {
      await _apiService.submitActivity(data);
    } catch (e) {
      throw 'Gagal mengirim aktivitas pembelajaran: ${e.toString()}';
    }
  }
}
