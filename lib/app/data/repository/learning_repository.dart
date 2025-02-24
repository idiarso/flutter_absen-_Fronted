import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../source/learning_api_service.dart';
import '../../../core/data/data_state.dart';

abstract class LearningRepository {
    Future<DataState<List<LearningActivity>>> getActivities();
    Future<DataState<LearningProgress>> getProgress();
    Future<DataState<void>> submitActivity(LearningActivity activity);
}

class LearningRepositoryImpl implements LearningRepository {
    final LearningApiService _apiService;

    LearningRepositoryImpl(this._apiService);

    @override
    Future<DataState<List<LearningActivity>>> getActivities() async {
        try {
            final response = await _apiService.getActivities();
            if (response.response.statusCode == 200 && response.data.success) {
                final List<dynamic> activitiesJson = response.data.data as List<dynamic>;
                final activities = activitiesJson
                    .map((json) => LearningActivity.fromJson(json as Map<String, dynamic>))
                    .toList();
                return DataSuccess(activities);
            } else {
                return DataFailed(response.data.message);
            }
        } on DioException catch (e) {
            return DataFailed(e.message ?? 'Unknown error occurred');
        }
    }

    @override
    Future<DataState<LearningProgress>> getProgress() async {
        try {
            final response = await _apiService.getProgress();
            if (response.response.statusCode == 200 && response.data.success) {
                final progressJson = response.data.data as Map<String, dynamic>;
                final progress = LearningProgress.fromJson(progressJson);
                return DataSuccess(progress);
            } else {
                return DataFailed(response.data.message);
            }
        } on DioException catch (e) {
            return DataFailed(e.message ?? 'Unknown error occurred');
        }
    }

    @override
    Future<DataState<void>> submitActivity(LearningActivity activity) async {
        try {
            final response = await _apiService.submitActivity(activity.toJson());
            if (response.response.statusCode == 200 && response.data.success) {
                return DataSuccess(null);
            } else {
                return DataFailed(response.data.message);
            }
        } on DioException catch (e) {
            return DataFailed(e.message ?? 'Unknown error occurred');
        }
    }
}
