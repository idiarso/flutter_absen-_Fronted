import 'package:get/get.dart';
import '../../../data/models/dashboard_model.dart';
import '../../../module/use_case/dashboard_get_summary.dart';
import '../../../module/use_case/dashboard_get_recent_activities.dart';
import '../../../module/use_case/dashboard_get_statistics.dart';

class DashboardController extends GetxController {
  final DashboardGetSummaryUseCase _getSummaryUseCase;
  final DashboardGetRecentActivitiesUseCase _getRecentActivitiesUseCase;
  final DashboardGetStatisticsUseCase _getStatisticsUseCase;

  DashboardController(
    this._getSummaryUseCase,
    this._getRecentActivitiesUseCase,
    this._getStatisticsUseCase,
  );

  final RxBool isLoading = false.obs;
  final Rx<DashboardSummary?> summary = Rx<DashboardSummary?>(null);
  final RxList<RecentActivity> recentActivities = <RecentActivity>[].obs;
  final Rx<DashboardStatistics?> statistics = Rx<DashboardStatistics?>(null);

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      final summaryResult = await _getSummaryUseCase();
      final activitiesResult = await _getRecentActivitiesUseCase();
      final statisticsResult = await _getStatisticsUseCase();

      summary.value = summaryResult;
      recentActivities.value = activitiesResult;
      statistics.value = statisticsResult;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memuat data dashboard',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
