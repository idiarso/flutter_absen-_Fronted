import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_api_service.g.dart';

@JsonSerializable()
class LearningActivity {
    final int id;
    final String title;
    final String description;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;

    LearningActivity({
        required this.id,
        required this.title,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory LearningActivity.fromJson(Map<String, dynamic> json) => _$LearningActivityFromJson(json);
    Map<String, dynamic> toJson() => _$LearningActivityToJson(this);
}

@JsonSerializable()
class LearningProgress {
    final int totalActivities;
    final int completedActivities;
    final double progressPercentage;

    LearningProgress({
        required this.totalActivities,
        required this.completedActivities,
        required this.progressPercentage,
    });

    factory LearningProgress.fromJson(Map<String, dynamic> json) => _$LearningProgressFromJson(json);
    Map<String, dynamic> toJson() => _$LearningProgressToJson(this);
}

@RestApi()
abstract class LearningApiService {
    factory LearningApiService(Dio dio, {String baseUrl}) = _LearningApiService;

    @GET('/api/learning/activities')
    Future<List<LearningActivity>> getActivities();

    @GET('/api/learning/progress')
    Future<LearningProgress> getProgress();

    @POST('/api/learning/submit')
    Future<void> submitActivity(@Body() Map<String, dynamic> data);
}
