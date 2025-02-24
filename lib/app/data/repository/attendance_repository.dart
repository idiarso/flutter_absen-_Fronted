import 'package:skansapung_presensi/app/data/model/attendance.dart';
import 'package:skansapung_presensi/app/data/source/attendance_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/app/module/repository/attendance_repository.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  final AttendanceApiService _attendanceApiService;

  AttendanceRepositoryImpl(this._attendanceApiService);

  @override
  Future<DataState<List<AttendanceEntity>>> getThisMonth() async {
    try {
      final response = await _attendanceApiService.getAttendanceToday();
      if (response.response.statusCode == 200 && response.data.success) {
        final attendanceModel = AttendanceModel.fromJson(response.data.toJson());
        return DataSuccess(attendanceModel.thisMonth);
      }
      return DataFailed(
        response.response.statusMessage ?? 'Unknown error occurred',
        response.response.statusCode,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<AttendanceEntity?>> getToday() async {
    try {
      final response = await _attendanceApiService.getAttendanceToday();
      if (response.response.statusCode == 200 && response.data.success) {
        final attendanceModel = AttendanceModel.fromJson(response.data.toJson());
        return DataSuccess(attendanceModel.today);
      }
      return DataFailed(
        response.response.statusMessage ?? 'Unknown error occurred',
        response.response.statusCode,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<bool>> sendAttendance(AttendanceParamEntity param) async {
    try {
      final response = await _attendanceApiService.sendAttendance(body: param.toJson());
      if (response.response.statusCode == 200) {
        return DataSuccess(response.data.success);
      }
      return DataFailed(
        response.response.statusMessage ?? 'Unknown error occurred',
        response.response.statusCode,
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
          month: param.month.toString(), year: param.year.toString());
      if (response.response.statusCode == 200 && response.data.success) {
        return DataSuccess(
          List<AttendanceEntity>.from(
              response.data.data.map((item) => AttendanceEntity.fromJson(item))),
        );
      }
      return DataFailed(
        response.response.statusMessage ?? 'Unknown error occurred',
        response.response.statusCode,
      );
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }
}
