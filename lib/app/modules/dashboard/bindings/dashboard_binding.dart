import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../data/providers/dashboard_provider.dart';
import '../../../module/use_case/dashboard_get_summary.dart';
import '../../../module/use_case/dashboard_get_recent_activities.dart';
import '../../../module/use_case/dashboard_get_statistics.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardProvider(Get.find()));
    
    Get.lazyPut(() => DashboardGetSummaryUseCase(Get.find()));
    Get.lazyPut(() => DashboardGetRecentActivitiesUseCase(Get.find()));
    Get.lazyPut(() => DashboardGetStatisticsUseCase(Get.find()));
    
    Get.lazyPut(() => DashboardController(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
