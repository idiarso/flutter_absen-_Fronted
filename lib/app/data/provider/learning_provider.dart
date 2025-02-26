import 'package:dio/dio.dart';
import '../models/learning_activity.dart';
import '../models/learning_progress.dart';

class LearningProvider {
  final Dio dio;

  LearningProvider(this.dio);

  Future<List<LearningActivity>> getActivities() async {
    try {
      final response = await dio.get('/activities');
      return (response.data as List)
          .map((json) => LearningActivity.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch activities: ${e.toString()}');
    }
  }

  Future<LearningProgress> getProgress() async {
    try {
      final response = await dio.get('/progress');
      return LearningProgress.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch progress: ${e.toString()}');
    }
  }
}