import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/piket_model.dart';

part 'piket_api_service.g.dart';

@RestApi()
abstract class PiketApiService {
  factory PiketApiService(Dio dio, {String baseUrl}) = _PiketApiService;

  // Schedule Endpoints
  @GET('/api/piket/schedule')
  Future<List<PiketSchedule>> getSchedule();

  @GET('/api/piket/schedule/my')
  Future<List<PiketSchedule>> getMySchedule();

  @POST('/api/piket/schedule')
  Future<void> createSchedule(@Body() PiketSchedule schedule);

  @PUT('/api/piket/schedule/{id}')
  Future<void> updateSchedule(
    @Path('id') int id,
    @Body() PiketSchedule schedule,
  );

  @DELETE('/api/piket/schedule/{id}')
  Future<void> deleteSchedule(@Path('id') int id);

  // Activity Endpoints
  @GET('/api/piket/activity')
  Future<List<PiketActivity>> getActivities({
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('status') String? status,
  });

  @POST('/api/piket/activity')
  @MultiPart()
  Future<void> createActivity({
    @Part(name: 'activity') required String activity,
    @Part(name: 'status') required String status,
    @Part(name: 'documentation') List<int>? documentation,
    @Part(name: 'filename') String? filename,
    @Part(name: 'notes') String? notes,
  });

  @PUT('/api/piket/activity/{id}')
  Future<void> updateActivity(
    @Path('id') int id,
    @Body() PiketActivity activity,
  );

  @DELETE('/api/piket/activity/{id}')
  Future<void> deleteActivity(@Path('id') int id);

  // Report Endpoints
  @GET('/api/piket/report')
  Future<List<PiketReport>> getReports({
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
  });

  @GET('/api/piket/report/{id}')
  Future<PiketReport> getReportDetail(@Path('id') int id);

  @POST('/api/piket/report/generate')
  Future<PiketReport> generateReport({
    @Query('start_date') required String startDate,
    @Query('end_date') required String endDate,
  });
}
