import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_api_service.g.dart';

@JsonSerializable()
class DashboardSummary {
    final int totalStudents;
    final int totalTeachers;
    final int totalClasses;
    final int totalAttendance;

    DashboardSummary({
        required this.totalStudents,
        required this.totalTeachers,
        required this.totalClasses,
        required this.totalAttendance,
    });

    factory DashboardSummary.fromJson(Map<String, dynamic> json) => _$DashboardSummaryFromJson(json);
    Map<String, dynamic> toJson() => _$DashboardSummaryToJson(this);
}

@JsonSerializable()
class RecentActivity {
    final int id;
    final String type;
    final String description;
    final DateTime timestamp;
    final String? userId;
    final String? userName;

    RecentActivity({
        required this.id,
        required this.type,
        required this.description,
        required this.timestamp,
        this.userId,
        this.userName,
    });

    factory RecentActivity.fromJson(Map<String, dynamic> json) => _$RecentActivityFromJson(json);
    Map<String, dynamic> toJson() => _$RecentActivityToJson(this);
}

@JsonSerializable()
class DashboardStatistics {
    final Map<String, int> attendanceByDay;
    final Map<String, int> attendanceByClass;
    final double averageAttendance;

    DashboardStatistics({
        required this.attendanceByDay,
        required this.attendanceByClass,
        required this.averageAttendance,
    });

    factory DashboardStatistics.fromJson(Map<String, dynamic> json) => _$DashboardStatisticsFromJson(json);
    Map<String, dynamic> toJson() => _$DashboardStatisticsToJson(this);
}

@RestApi()
abstract class DashboardApiService {
    factory DashboardApiService(Dio dio, {String baseUrl}) = _DashboardApiService;

    @GET('/api/dashboard/summary')
    Future<DashboardSummary> getSummary();

    @GET('/api/dashboard/recent-activities')
    Future<List<RecentActivity>> getRecentActivities();

    @GET('/api/dashboard/statistics')
    Future<DashboardStatistics> getStatistics();
}
