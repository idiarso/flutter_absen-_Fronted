import 'package:skansapung_presensi/app/data/model/attendance.dart';
import 'package:skansapung_presensi/app/data/source/attendance_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/app/module/repository/attendance_repository.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:dio/dio.dart';

class AttendanceResponse {
  final int statusCode;
  final String statusMessage;
  final dynamic data;

  AttendanceResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.data,
  });

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
      return DataState<List<AttendanceEntity>>(
        success: true,
        message: "Success",
        data: attendanceModel.thisMonth,
      );
    } on DioException catch (e) {
      return DataState<List<AttendanceEntity>>(
        success: false,
        message: e.message ?? 'Unknown error occurred',
        data: null,
      );
    } catch (e) {
      return DataState<List<AttendanceEntity>>(
        success: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() async {
    try {
      final response = await _attendanceApiService.getAttendanceToday();
      final attendanceModel = AttendanceModel.fromJson(response.data.toJson());
      return DataState<AttendanceEntity?>(
        success: true,
        message: "Success",
        data: attendanceModel.today,
      );
    } on DioException catch (e) {
      return DataState<AttendanceEntity?>(
        success: false,
        message: e.message ?? 'Unknown error occurred',
        data: null,
      );
    } catch (e) {
      return DataState<AttendanceEntity?>(
        success: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  @override
  Future<DataState<dynamic>> sendAttendance(AttendanceParamEntity param) async {
    try {
      final response = await _attendanceApiService.sendAttendance(
        body: param.toJson(),
      );
      return DataState<dynamic>(success: true, message: "Success", data: true);
    } on DioException catch (e) {
      return DataState<dynamic>(
        success: false,
        message: e.message ?? 'Error occurred while sending attendance',
        data: null,
      );
    } catch (e) {
      return DataState<dynamic>(
        success: false,
        message: e.toString(),
        data: null,
      );
    }
  }

  @override
  Future<DataState<List<AttendanceEntity>>> getByMonthYear(
    AttendanceParamGetEntity param,
  ) async {
    try {
      final response = await _attendanceApiService.getAttendanceByMonthYear(
        param.month.toString(),
        param.year.toString(),
      );
      if (response.isNotEmpty) {
        return DataState<List<AttendanceEntity>>(
          success: true,
          message: "Success",
          data: List<AttendanceEntity>.from(
            response.map((item) => AttendanceEntity.fromJson(item.toJson())),
          ),
        );
      }
      return DataState<List<AttendanceEntity>>(
        success: false,
        message: 'No data found',
        data: [],
      );
    } catch (e) {
      return DataState<List<AttendanceEntity>>(
        success: false,
        message: e.toString(),
        data: null,
      );
    }
  }
}
