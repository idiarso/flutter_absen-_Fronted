import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../data/providers/pkl_provider.dart';
import '../../../data/source/pkl_api_service.dart';
import '../../../module/use_case/pkl_get_locations.dart';
import '../../../module/use_case/pkl_get_progress.dart';
import '../../../module/use_case/pkl_get_student.dart';
import '../../../module/use_case/pkl_submit_daily_report.dart';
import '../controllers/jurnal_pkl_controller.dart';

class JurnalPKLBinding extends Bindings {
  @override
  void dependencies() {
    // API Service
    final dio = Get.find<Dio>();
    final apiService = PKLApiService(dio);
    
    // Provider
    final provider = PKLProvider(apiService);
    
    // Use Cases
    final getLocationsUseCase = PKLGetLocationsUseCase(provider);
    final getStudentUseCase = PKLGetStudentUseCase(provider);
    final submitDailyReportUseCase = PKLSubmitDailyReportUseCase(provider);
    final getProgressUseCase = PKLGetProgressUseCase(provider);

    // Controller
    Get.lazyPut<JurnalPKLController>(
      () => JurnalPKLController(
        getLocationsUseCase,
        getStudentUseCase,
        submitDailyReportUseCase,
        getProgressUseCase,
      ),
    );
  }
}
