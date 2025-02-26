import '../source/learning_api_service.dart';

class LearningProvider {
  final LearningApiService _apiService;

  LearningProvider(this._apiService);

  Future<List<LearningActivity>> getActivities() async {
    try {
      final response = await _apiService.getActivities();
      if (response.data.success) {
        final List<dynamic> activitiesJson =
            response.data.data as List<dynamic>;
        return activitiesJson
            .map(
              (json) => LearningActivity.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw response.data.message;
      }
    } catch (e) {
      throw 'Gagal mendapatkan data aktivitas pembelajaran: ${e.toString()}';
    }
  }

  Future<LearningProgress> getProgress() async {
    try {
      final response = await _apiService.getProgress();
      if (response.data.success) {
        return LearningProgress.fromJson(
          response.data.data as Map<String, dynamic>,
        );
      } else {
        throw response.data.message;
      }
    } catch (e) {
      throw 'Gagal mendapatkan progress pembelajaran: ${e.toString()}';
    }
  }

  Future<void> submitActivity(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.submitActivity(data);
      if (!response.data.success) {
        throw response.data.message;
      }
    } catch (e) {
      throw 'Gagal mengirim aktivitas pembelajaran: ${e.toString()}';
    }
  }
}
