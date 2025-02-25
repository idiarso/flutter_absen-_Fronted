import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';

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

    factory DashboardSummary.fromJson(Map<String, dynamic> json) {
        // Implementasi manual untuk menangani API yang mengembalikan format yang tidak sesuai
        try {
            return DashboardSummary(
                totalStudents: json['totalStudents'] ?? 0,
                totalTeachers: json['totalTeachers'] ?? 0,
                totalClasses: json['totalClasses'] ?? 0,
                totalAttendance: json['totalAttendance'] ?? 0,
            );
        } catch (e) {
            // Jika terjadi error, kembalikan nilai default
            return DashboardSummary(
                totalStudents: 0,
                totalTeachers: 0,
                totalClasses: 0,
                totalAttendance: 0,
            );
        }
    }
    
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

    factory RecentActivity.fromJson(Map<String, dynamic> json) {
        // Implementasi manual untuk menangani API yang mengembalikan format yang tidak sesuai
        try {
            return RecentActivity(
                id: json['id'] ?? 0,
                type: json['type'] ?? '',
                description: json['description'] ?? '',
                timestamp: json['timestamp'] != null 
                    ? DateTime.parse(json['timestamp']) 
                    : DateTime.now(),
                userId: json['userId'],
                userName: json['userName'],
            );
        } catch (e) {
            // Jika terjadi error, kembalikan nilai default
            return RecentActivity(
                id: 0,
                type: 'unknown',
                description: 'No data available',
                timestamp: DateTime.now(),
                userId: null,
                userName: null,
            );
        }
    }
    
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

    factory DashboardStatistics.fromJson(Map<String, dynamic> json) {
        // Implementasi manual untuk menangani API yang mengembalikan format yang tidak sesuai
        try {
            return DashboardStatistics(
                attendanceByDay: json['attendanceByDay'] != null 
                    ? Map<String, int>.from(json['attendanceByDay']) 
                    : {},
                attendanceByClass: json['attendanceByClass'] != null 
                    ? Map<String, int>.from(json['attendanceByClass']) 
                    : {},
                averageAttendance: json['averageAttendance']?.toDouble() ?? 0.0,
            );
        } catch (e) {
            // Jika terjadi error, kembalikan nilai default
            return DashboardStatistics(
                attendanceByDay: {},
                attendanceByClass: {},
                averageAttendance: 0.0,
            );
        }
    }
    
    Map<String, dynamic> toJson() => _$DashboardStatisticsToJson(this);
}

@RestApi(baseUrl: BASE_URL)
abstract class DashboardApiService {
    factory DashboardApiService(Dio dio) = _DashboardApiService;

    @GET('/api/dashboard/summary')
    Future<DashboardSummary> getSummary();

    @GET('/api/dashboard/recent-activities')
    Future<List<RecentActivity>> getRecentActivities();

    @GET('/api/dashboard/statistics')
    Future<DashboardStatistics> getStatistics();
}
