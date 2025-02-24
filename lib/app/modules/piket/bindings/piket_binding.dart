import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../data/providers/piket_provider.dart';
import '../../../data/source/piket_api_service.dart';
import '../../../module/use_case/piket_use_cases.dart';
import '../controllers/piket_controller.dart';

class PiketBinding extends Bindings {
  @override
  void dependencies() {
    // API Service
    final dio = Get.find<Dio>();
    final apiService = PiketApiService(dio);
    
    // Provider
    final provider = PiketProvider(apiService);
    
    // Use Cases
    final getScheduleUseCase = GetPiketScheduleUseCase(provider);
    final getMyScheduleUseCase = GetMyPiketScheduleUseCase(provider);
    final createScheduleUseCase = CreatePiketScheduleUseCase(provider);
    final updateScheduleUseCase = UpdatePiketScheduleUseCase(provider);
    final deleteScheduleUseCase = DeletePiketScheduleUseCase(provider);
    final getActivitiesUseCase = GetPiketActivitiesUseCase(provider);
    final createActivityUseCase = CreatePiketActivityUseCase(provider);
    final updateActivityUseCase = UpdatePiketActivityUseCase(provider);
    final deleteActivityUseCase = DeletePiketActivityUseCase(provider);
    final getReportsUseCase = GetPiketReportsUseCase(provider);
    final getReportDetailUseCase = GetPiketReportDetailUseCase(provider);
    final generateReportUseCase = GeneratePiketReportUseCase(provider);

    // Controller
    Get.lazyPut<PiketController>(
      () => PiketController(
        getScheduleUseCase,
        getMyScheduleUseCase,
        createScheduleUseCase,
        updateScheduleUseCase,
        deleteScheduleUseCase,
        getActivitiesUseCase,
        createActivityUseCase,
        updateActivityUseCase,
        deleteActivityUseCase,
        getReportsUseCase,
        getReportDetailUseCase,
        generateReportUseCase,
      ),
    );
  }
}
