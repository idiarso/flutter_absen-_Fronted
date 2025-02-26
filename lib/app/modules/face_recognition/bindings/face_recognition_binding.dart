import 'package:get/get.dart';
import '../face_recognition_notifier.dart';
import 'package:skansapung_presensi/app/module/use_case/photo_get_bytes.dart';
import 'package:skansapung_presensi/app/module/use_case/attendance_send.dart';
import 'package:skansapung_presensi/app/data/repository/photo_repository.dart';
import 'package:skansapung_presensi/app/data/source/photo_api_service.dart';
import 'package:dio/dio.dart';

class FaceRecognitionBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AttendanceSendUseCase is available
    if (!Get.isRegistered<AttendanceSendUseCase>()) {
      Get.lazyPut<AttendanceSendUseCase>(() => Get.find());
    }

    Get.lazyPut<Dio>(() => Dio());
    Get.lazyPut<PhotoApiService>(() => PhotoApiService(Get.find<Dio>()));
    Get.lazyPut<PhotoRepository>(
      () => PhotoRepositoryImpl(Get.find<PhotoApiService>()),
    );
    Get.lazyPut<PhotoGetBytesUseCase>(
      () => PhotoGetBytesUseCase(Get.find<PhotoRepository>()),
    );
    Get.lazyPut<FaceRecognitionNotifier>(
      () => FaceRecognitionNotifier(Get.find<PhotoGetBytesUseCase>()),
    );
  }
}
