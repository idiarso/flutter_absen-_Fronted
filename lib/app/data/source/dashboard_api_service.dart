import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboard_api_service.g.dart';

@RestApi()
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio, {String baseUrl}) = _DashboardApiService;

  @GET('/api/dashboard/summary')
  Future<Map<String, dynamic>> getSummary();

  @GET('/api/dashboard/recent-activities')
  Future<List<Map<String, dynamic>>> getRecentActivities();

  @GET('/api/dashboard/statistics')
  Future<Map<String, dynamic>> getStatistics();
}
