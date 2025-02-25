import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../data/providers/dashboard_provider.dart';
import '../../../module/use_case/dashboard_get_summary.dart';
import '../../../module/use_case/dashboard_get_recent_activities.dart';
import '../../../module/use_case/dashboard_get_statistics.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Register provider first
    Get.lazyPut<DashboardProvider>(() => DashboardProvider(Get.find()));
    
    // Register use cases
    Get.lazyPut<DashboardGetSummaryUseCase>(() => DashboardGetSummaryUseCase(Get.find()));
    Get.lazyPut<DashboardGetRecentActivitiesUseCase>(() => DashboardGetRecentActivitiesUseCase(Get.find()));
    Get.lazyPut<DashboardGetStatisticsUseCase>(() => DashboardGetStatisticsUseCase(Get.find()));
    
    // Register controller last since it depends on use cases
    Get.lazyPut<DashboardController>(() => DashboardController(
          Get.find<DashboardGetSummaryUseCase>(),
          Get.find<DashboardGetRecentActivitiesUseCase>(),
          Get.find<DashboardGetStatisticsUseCase>(),
        ));
  }
}
