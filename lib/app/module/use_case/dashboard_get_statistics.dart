import '../../data/models/dashboard_model.dart';
import '../../data/providers/dashboard_provider.dart';

class DashboardGetStatisticsUseCase {
  final DashboardProvider _provider;

  DashboardGetStatisticsUseCase(this._provider);

  Future<DashboardStatistics> call() async {
    final result = await _provider.getStatistics();
    return DashboardStatistics.fromJson(result);
  }
}
