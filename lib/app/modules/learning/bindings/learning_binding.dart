import 'package:get/get.dart';
import '../controllers/learning_controller.dart';
import '../../../data/providers/learning_provider.dart';
import '../../../module/use_case/learning_get_activities.dart';
import '../../../module/use_case/learning_get_progress.dart';
import '../../../module/use_case/learning_submit_activity.dart';

class LearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearningProvider(Get.find()));
    
    Get.lazyPut(() => LearningGetActivitiesUseCase(Get.find()));
    Get.lazyPut(() => LearningGetProgressUseCase(Get.find()));
    Get.lazyPut(() => LearningSubmitActivityUseCase(Get.find()));
    
    Get.lazyPut(() => LearningController(
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
