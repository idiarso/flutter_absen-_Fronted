import '../../data/models/dashboard_model.dart';
import '../../data/providers/dashboard_provider.dart';

class DashboardGetRecentActivitiesUseCase {
  final DashboardProvider _provider;

  DashboardGetRecentActivitiesUseCase(this._provider);

  Future<List<RecentActivity>> call() async {
    final result = await _provider.getRecentActivities();
    return result.map((e) => RecentActivity.fromJson(e)).toList();
  }
}
