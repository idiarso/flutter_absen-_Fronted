import 'package:skansapung_presensi/app/data/source/schedule_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/schedule.dart';
import 'package:skansapung_presensi/app/module/repository/schedule_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:dio/dio.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleApiService _scheduleApiService;

  ScheduleRepositoryImpl(this._scheduleApiService);

  @override
  Future<DataState<ScheduleEntity?>> get() async {
    try {
      final response = await _scheduleApiService.get();
      if (response.success) {
        if (response.schedules.isNotEmpty) {
          final data = ScheduleEntity.fromJson(response.schedules[0].toJson());
          SharedPreferencesHelper.setString(
              PREF_START_SHIFT, data.shift.startTime);
          SharedPreferencesHelper.setString(PREF_END_SHIFT, data.shift.endTime);
          return DataState(success: true, message: "Success", data: data);
        }
      }
      return DataState(success: false, message: "No schedules found", data: null);
    } on DioException catch (e) {
      return DataState(success: false, message: e.message ?? 'Failed to load schedule', data: null);
    }
  }

  @override
  Future<DataState<dynamic>> banned() async {
    try {
      final response = await _scheduleApiService.banned();
      if (response.success) {
        return DataState(success: true, message: "Success", data: response.isBanned);
      }
      return DataState(success: false, message: response.message, data: null);
    } on DioException catch (e) {
      return DataState(success: false, message: e.message ?? 'Unknown error', data: null);
    } catch (e) {
      return DataState(success: false, message: e.toString(), data: null);
    }
  }
}
