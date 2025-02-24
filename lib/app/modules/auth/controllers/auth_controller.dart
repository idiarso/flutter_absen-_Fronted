import 'package:get/get.dart';
import '../../../data/models/user_model.dart';

class AuthController extends GetxController {
  final user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    // TODO: Load user data from storage or API
  }

  Future<void> login(String username, String password) async {
    try {
      // TODO: Implement login logic
      // user.value = await _authService.login(username, password);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to login: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    user.value = null;
    Get.offAllNamed('/login');
  }
}
