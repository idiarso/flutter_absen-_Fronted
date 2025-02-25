import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_api_service.g.dart';

@JsonSerializable()
class Schedule {
  final int id;
  final String day;
  final String startTime;
  final String endTime;
  final String subject;
  final String? teacher;
  final String? room;

  Schedule({
    required this.id,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.subject,
    this.teacher,
    this.room,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
class ScheduleResponse {
  final bool success;
  final String message;
  final List<Schedule> schedules;

  ScheduleResponse({
    required this.success,
    required this.message,
    required this.schedules,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}

@JsonSerializable()
class BannedResponse {
  final bool success;
  final String message;
  final bool isBanned;
  final String? reason;
  final DateTime? bannedUntil;

  BannedResponse({
    required this.success,
    required this.message,
    required this.isBanned,
    this.reason,
    this.bannedUntil,
  });

  factory BannedResponse.fromJson(Map<String, dynamic> json) =>
      _$BannedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BannedResponseToJson(this);
}

@RestApi(baseUrl: BASE_URL)
abstract class ScheduleApiService {
  factory ScheduleApiService(Dio dio) = _ScheduleApiService;

  @GET('/api/get-schedule')
  Future<ScheduleResponse> get();

  @POST('/api/banned')
  Future<BannedResponse> banned();
}
