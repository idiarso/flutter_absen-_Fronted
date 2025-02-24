import '../../data/models/dashboard_model.dart';
import '../../data/providers/dashboard_provider.dart';

class DashboardGetSummaryUseCase {
  final DashboardProvider _provider;

  DashboardGetSummaryUseCase(this._provider);

  Future<DashboardSummary> call() async {
    final result = await _provider.getSummary();
    return DashboardSummary.fromJson(result);
  }
}
