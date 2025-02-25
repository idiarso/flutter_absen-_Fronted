import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendance_api_service.g.dart';

@JsonSerializable()
class AttendanceRecord {
  final int id;
  final String userId;
  final DateTime timestamp;
  final String type;
  final String status;
  final String? notes;

  AttendanceRecord({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.type,
    required this.status,
    this.notes,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRecordFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceRecordToJson(this);
}

@JsonSerializable()
class AttendanceResponse {
  final bool success;
  final String message;
  final dynamic data;

  AttendanceResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data};
  }
}

@RestApi(baseUrl: BASE_URL)
abstract class AttendanceApiService {
  factory AttendanceApiService(Dio dio) = _AttendanceApiService;

  @GET('/api/get-attendance-today')
  Future<AttendanceResponse> getAttendanceToday();

  @POST("/api/attendance/submit")
  Future<HttpResponse<AttendanceResponse>> sendAttendance({
    @Body() required Map<String, dynamic> body,
  });

  @GET('/api/get-attendance-by-month-year/{month}/{year}')
  Future<List<AttendanceRecord>> getAttendanceByMonthYear(
    @Path('month') String month,
    @Path('year') String year,
  );
}
