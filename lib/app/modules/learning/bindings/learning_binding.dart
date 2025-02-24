import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../controllers/learning_controller.dart';
import '../../../data/source/learning_api_service.dart';
import '../../../data/repository/learning_repository.dart';
import '../../../module/use_case/learning_get_activities.dart';
import '../../../module/use_case/learning_get_progress.dart';
import '../../../module/use_case/learning_submit_activity.dart';

class LearningBinding extends Bindings {
  @override
  void dependencies() {
    // API Service
    Get.lazyPut(() => LearningApiService(Get.find<Dio>()));
    
    // Repository
    Get.lazyPut<LearningRepository>(() => LearningRepositoryImpl(Get.find()));
    
    // Use Cases
    Get.lazyPut(() => LearningGetActivitiesUseCase(Get.find()));
    Get.lazyPut(() => LearningGetProgressUseCase(Get.find()));
    Get.lazyPut(() => LearningSubmitActivityUseCase(Get.find()));
    
    // Controller
    Get.lazyPut(() => LearningController(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
