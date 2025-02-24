import 'package:skansapung_presensi/app/data/models/dashboard_model.dart';
import 'package:skansapung_presensi/app/data/source/dashboard_api_service.dart';
import 'package:skansapung_presensi/app/module/repository/dashboard_repository.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final DashboardApiService _dashboardApiService;

  DashboardRepositoryImpl(this._dashboardApiService);

  @override
  Future<DataState<DashboardSummary>> getSummary() async {
    try {
      final response = await _dashboardApiService.getSummary();
      if (response.response.statusCode == 200 && response.data.success) {
        return DataSuccess(DashboardSummary.fromJson(response.data.data));
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
  Future<DataState<List<RecentActivity>>> getRecentActivities() async {
    try {
      final response = await _dashboardApiService.getRecentActivities();
      if (response.response.statusCode == 200 && response.data.success) {
        return DataSuccess(
          List<RecentActivity>.from(
              response.data.data.map((item) => RecentActivity.fromJson(item))),
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

  @override
  Future<DataState<DashboardStatistics>> getStatistics() async {
    try {
      final response = await _dashboardApiService.getStatistics();
      if (response.response.statusCode == 200 && response.data.success) {
        return DataSuccess(DashboardStatistics.fromJson(response.data.data));
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
