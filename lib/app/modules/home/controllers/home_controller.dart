import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxString userName = 'Siswa'.obs;

  void navigateToLearning() {
    Get.toNamed('/learning');
  }

  void navigateToDashboard() {
    Get.toNamed('/dashboard');
  }

  void navigateToJurnalPKL() {
    Get.toNamed('/jurnal-pkl');
  }

  void navigateToProfile() {
    // TODO: Implement profile navigation
  }

  void logout() {
    Get.offAllNamed('/login');
  }
}
