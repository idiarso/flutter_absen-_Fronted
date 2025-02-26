import 'package:dio/dio.dart';
import '../../../core/data/data_state.dart';
import '../models/piket_model.dart';
import '../providers/piket_provider.dart';

class PiketRepositoryImpl {
  final PiketProvider _provider;

  PiketRepositoryImpl(this._provider);

  Future<DataState<List<PiketSchedule>>> getSchedule() async {
    try {
      final result = await _provider.getSchedule();
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }

  Future<DataState<List<PiketSchedule>>> getMySchedule() async {
    try {
      final result = await _provider.getMySchedule();
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }

  Future<DataState<void>> createSchedule(PiketSchedule schedule) async {
    try {
      await _provider.createSchedule(schedule);
      return const DataSuccess(null);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }

  Future<DataState<void>> updateSchedule(int id, PiketSchedule schedule) async {
    try {
      await _provider.updateSchedule(id, schedule);
      return const DataSuccess(null);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }

  Future<DataState<void>> deleteSchedule(int id) async {
    try {
      await _provider.deleteSchedule(id);
      return const DataSuccess(null);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }

  Future<DataState<List<PiketActivity>>> getActivities({
    String? startDate,
    String? endDate,
    String? status,
  }) async {
    try {
      final result = await _provider.getActivities(
        startDate: startDate,
        endDate: endDate,
        status: status,
      );
      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e.message ?? 'Unknown error occurred');
    }
  }
}