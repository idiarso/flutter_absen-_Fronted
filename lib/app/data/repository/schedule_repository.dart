import 'package:skansapung_presensi/app/data/source/schedule_api_service.dart';
import 'package:skansapung_presensi/app/module/entity/schedule.dart';
import 'package:skansapung_presensi/app/module/repository/schedule_repository.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/app/core/data/data_state.dart';
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
          return DataSuccess(data);
        }
        return const DataSuccess(null);
      }
      return DataFailed(
        response.message,
        404,
      );
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error', e.response?.statusCode ?? 500);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }

  @override
  Future<DataState<bool>> banned() async {
    try {
      final response = await _scheduleApiService.banned();
      if (response.success) {
        return DataSuccess(response.isBanned);
      }
      return DataFailed(
        response.message,
        404,
      );
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error', e.response?.statusCode ?? 500);
    } catch (e) {
      return DataFailed(e.toString(), 500);
    }
  }
}
