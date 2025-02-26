import 'package:skansapung_presensi/app/data/models/dashboard_model.dart' as model;
import 'package:skansapung_presensi/app/data/source/dashboard_api_service.dart' as api;
import 'package:skansapung_presensi/app/module/repository/dashboard_repository.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final api.DashboardApiService _dashboardApiService;

  DashboardRepositoryImpl(this._dashboardApiService);

  @override
  Future<DataState<model.DashboardSummary>> getSummary() async {
    try {
      final response = await _dashboardApiService.getSummary();
      return SuccessState(
        data: model.DashboardSummary.fromJson(response as Map<String, dynamic>),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<List<model.RecentActivity>>> getRecentActivities() async {
    try {
      final response = await _dashboardApiService.getRecentActivities();
      final List<dynamic> activitiesJson = response as List<dynamic>;
      return SuccessState(
        data: activitiesJson
            .map((item) => model.RecentActivity.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<model.DashboardStatistics>> getStatistics() async {
    try {
      final response = await _dashboardApiService.getStatistics();
      return SuccessState(
        data: model.DashboardStatistics.fromJson(response as Map<String, dynamic>),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }
}
