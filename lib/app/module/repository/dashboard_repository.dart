import 'package:skansapung_presensi/core/network/data_state.dart';
import 'package:skansapung_presensi/app/data/models/dashboard_model.dart' as dashboardModel;
import 'package:skansapung_presensi/app/data/models/recent_activity.dart';
import 'package:skansapung_presensi/app/data/models/dashboard_statistics.dart';

abstract class DashboardRepository {
  Future<DataState<dashboardModel.DashboardSummary>> getSummary();
  Future<DataState<List<RecentActivity>>> getRecentActivities();
  Future<DataState<DashboardStatistics>> getStatistics();
}