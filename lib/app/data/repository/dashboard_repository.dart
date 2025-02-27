import 'package:skansapung_presensi/app/data/models/dashboard_model.dart'
    as dashboardModel;
import 'package:skansapung_presensi/app/data/source/dashboard_api_service.dart'
    as api;
import 'package:skansapung_presensi/app/module/repository/dashboard_repository.dart';
import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:skansapung_presensi/app/data/models/recent_activity.dart';
import 'package:skansapung_presensi/app/data/models/dashboard_statistics.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final api.DashboardApiService _dashboardApiService;

  DashboardRepositoryImpl(this._dashboardApiService);

  @override
  Future<DataState<dashboardModel.DashboardSummary>> getSummary() async {
    try {
      final response = await _dashboardApiService.getSummary();
      return SuccessState(
        data: dashboardModel.DashboardSummary.fromJson(
          response as Map<String, dynamic>,
        ),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<List<RecentActivity>>> getRecentActivities() async {
    try {
      final response = await _dashboardApiService.getRecentActivities();
      final List<dynamic> activitiesJson = response as List<dynamic>;
      return SuccessState(
        data:
            activitiesJson
                .map(
                  (item) =>
                      RecentActivity.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }

  @override
  Future<DataState<DashboardStatistics>> getStatistics() async {
    try {
      final response = await _dashboardApiService.getStatistics();
      return SuccessState(
        data: DashboardStatistics.fromJson(response as Map<String, dynamic>),
      );
    } catch (e) {
      return ErrorState(message: e.toString());
    }
  }
}
