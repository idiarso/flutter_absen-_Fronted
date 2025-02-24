import 'package:get/get.dart';
import '../../../data/source/learning_api_service.dart';
import '../../../module/use_case/learning_get_activities.dart';
import '../../../module/use_case/learning_get_progress.dart';
import '../../../module/use_case/learning_submit_activity.dart';

class LearningController extends GetxController {
    final LearningGetActivitiesUseCase _getActivitiesUseCase;
    final LearningGetProgressUseCase _getProgressUseCase;
    final LearningSubmitActivityUseCase _submitActivityUseCase;

    LearningController(
        this._getActivitiesUseCase,
        this._getProgressUseCase,
        this._submitActivityUseCase,
    );

    final activities = <LearningActivity>[].obs;
    final progress = Rxn<LearningProgress>();
    final isLoading = false.obs;

    @override
    void onInit() {
        super.onInit();
        fetchData();
    }

    Future<void> fetchData() async {
        isLoading.value = true;
        try {
            final results = await Future.wait([
                _getActivitiesUseCase(),
                _getProgressUseCase(),
            ]);
            activities.value = results[0] as List<LearningActivity>;
            progress.value = results[1] as LearningProgress;
        } catch (e) {
            Get.snackbar(
                'Error',
                'Failed to load learning data: ${e.toString()}',
                snackPosition: SnackPosition.BOTTOM,
            );
        } finally {
            isLoading.value = false;
        }
    }

    Future<void> submitActivity(LearningActivity activity) async {
        try {
            await _submitActivityUseCase(activity);
            await fetchData(); // Refresh data after submission
            Get.snackbar(
                'Success',
                'Activity submitted successfully',
                snackPosition: SnackPosition.BOTTOM,
            );
        } catch (e) {
            Get.snackbar(
                'Error',
                'Failed to submit activity: ${e.toString()}',
                snackPosition: SnackPosition.BOTTOM,
            );
        }
    }
}
