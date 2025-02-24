import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'learning_api_service.g.dart';

@RestApi()
abstract class LearningApiService {
  factory LearningApiService(Dio dio, {String baseUrl}) = _LearningApiService;

  @GET('/api/learning/activities')
  Future<List<Map<String, dynamic>>> getActivities();

  @GET('/api/learning/progress')
  Future<Map<String, dynamic>> getProgress();

  @POST('/api/learning/submit')
  Future<void> submitActivity(@Body() Map<String, dynamic> data);
}
