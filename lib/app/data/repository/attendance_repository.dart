import 'package:skansapung_presensi/app/data/model/attendance.dart';
import 'package:skansapung_presensi/app/data/source/attendance_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/app/module/repository/attendance_repository.dart';
import 'package:skansapung_presensi/app/core/data/data_state.dart';
import 'package:retrofit/dio.dart';
import 'package:dio/dio.dart';

class AttendanceResponse {
  final int statusCode;
  final String statusMessage;
  final dynamic data;

  AttendanceResponse({required this.statusCode, required this.statusMessage, required this.data});

  factory AttendanceResponse.fromJson(Map<String, dynamic> json) {
    return AttendanceResponse(
      statusCode: json['statusCode'] ?? 200,
      statusMessage: json['statusMessage'] ?? '',
      data: json['data'],
    );
  }
}

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() async {
    try {
      final response = await _attendanceApiService.getAttendanceToday();
      final attendanceModel = AttendanceModel.fromJson(response.data.toJson());
      return DataSuccess<List<AttendanceEntity>>(attendanceModel.thisMonth);
    } on DioException catch (e) {
      return DataFailed(
        e.message ?? 'Unknown error occurred',
        e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() async {
    try {
      final response = await _attendanceApiService.getAttendanceToday();
      final attendanceModel = AttendanceModel.fromJson(response.data.toJson());
      return DataSuccess<AttendanceEntity?>(attendanceModel.today);
    } on DioException catch (e) {
      return DataFailed(
        e.message ?? 'Unknown error occurred',
        e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param) async {
    try {
      final response = await _attendanceApiService.sendAttendance(body: param.toJson());
      return const DataSuccess<bool>(true);
    } on DioException catch (e) {
      return DataFailed(
        e.message ?? 'Error occurred while sending attendance',
        e.response?.statusCode ?? 500,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
      AttendanceParamGetEntity param) async {
    try {
      final response = await _attendanceApiService.getAttendanceByMonthYear(
          param.month.toString(), param.year.toString());
      if (response.isNotEmpty) {
        return DataSuccess<List<AttendanceEntity>>(
          List<AttendanceEntity>.from(
              response.map((item) => AttendanceEntity.fromJson(item.toJson()))),
        );
      }
      return DataFailed<List<AttendanceEntity>>('No data found', 404);
    } catch (e) {
      return DataFailed<List<AttendanceEntity>>(e.toString(), 500);
    }
  }
}
