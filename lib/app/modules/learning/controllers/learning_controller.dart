import 'package:get/get.dart';
import '../../../data/models/learning_model.dart';
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

  final RxBool isLoading = false.obs;
  final RxList<LearningActivity> activities = <LearningActivity>[].obs;
  final Rx<LearningProgress?> progress = Rx<LearningProgress?>(null);

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      final activitiesResult = await _getActivitiesUseCase();
      final progressResult = await _getProgressUseCase();
      
      activities.value = activitiesResult;
      progress.value = progressResult;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memuat data pembelajaran',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitActivity(LearningActivity activity) async {
    try {
      await _submitActivityUseCase(activity);
      await loadData(); // Refresh data after submission
      Get.snackbar(
        'Sukses',
        'Aktivitas pembelajaran berhasil dikirim',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengirim aktivitas pembelajaran',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
