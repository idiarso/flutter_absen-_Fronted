import 'package:get/get.dart';
import '../../../data/source/learning_api_service.dart';
import '../../../module/use_case/learning_get_activities.dart';
import '../../../module/use_case/learning_get_progress.dart';
import '../../../module/use_case/learning_submit_activity.dart';
import '../../../core/data/data_state.dart';

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
    final error = Rxn<String>();

    @override
    void onInit() {
        super.onInit();
        fetchData();
    }

    Future<void> fetchData() async {
        isLoading.value = true;
        error.value = null;
        
        try {
            final activitiesResult = await _getActivitiesUseCase();
            final progressResult = await _getProgressUseCase();

            if (activitiesResult is DataSuccess) {
                activities.value = activitiesResult.data ?? [];
            } else if (activitiesResult is DataFailed) {
                error.value = activitiesResult.error;
                return;
            }

            if (progressResult is DataSuccess) {
                progress.value = progressResult.data;
            } else if (progressResult is DataFailed) {
                error.value = progressResult.error;
                return;
            }
        } catch (e) {
            error.value = e.toString();
        } finally {
            isLoading.value = false;
        }
    }

    Future<void> submitActivity(LearningActivity activity) async {
        try {
            isLoading.value = true;
            error.value = null;
            
            final result = await _submitActivityUseCase(activity);
            
            if (result is DataSuccess) {
                Get.snackbar(
                    'Success',
                    'Activity submitted successfully',
                    snackPosition: SnackPosition.BOTTOM,
                );
                await fetchData();
            } else if (result is DataFailed) {
                error.value = result.error;
                Get.snackbar(
                    'Error',
                    'Failed to submit activity: ${result.error}',
                    snackPosition: SnackPosition.BOTTOM,
                );
            }
        } catch (e) {
            error.value = e.toString();
            Get.snackbar(
                'Error',
                'Failed to submit activity: ${e.toString()}',
                snackPosition: SnackPosition.BOTTOM,
            );
        } finally {
            isLoading.value = false;
        }
    }
}
