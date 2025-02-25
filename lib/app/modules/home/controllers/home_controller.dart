import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/core/constant/constant.dart';

class HomeController extends GetxController {
  final RxString userName = 'Siswa'.obs;
  final RxBool isLoading = true.obs;
  final RxString checkInTime = '-- : --'.obs;
  final RxString checkOutTime = '-- : --'.obs;
  final RxBool hasCheckedIn = false.obs;
  final RxBool hasCheckedOut = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
    _loadAttendanceStatus();
  }

  // Memuat data pengguna dari shared preferences
  Future<void> _loadUserData() async {
    String name = await SharedPreferencesHelper.getString(PREF_NAME) ?? 'Siswa';
    userName.value = name;
  }

  // Memuat status kehadiran (dalam implementasi nyata, ini akan mengambil dari API)
  Future<void> _loadAttendanceStatus() async {
    isLoading.value = true;
    
    try {
      // Simulasi loading data dari API
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Contoh data mock untuk tujuan demonstrasi
      // Dalam implementasi nyata, Anda akan mengambil data ini dari API
      final currentTime = DateTime.now();
      if (currentTime.hour >= 7) {
        checkInTime.value = '07:30';
        hasCheckedIn.value = true;
      }
      
      if (currentTime.hour >= 16) {
        checkOutTime.value = '16:00';
        hasCheckedOut.value = true;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memuat data kehadiran: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Menangani presensi dengan pengenalan wajah
  void handleAttendance() {
    Get.toNamed('/face-recognition');
  }

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
    Get.toNamed('/profile');
  }

  void logout() {
    // Hapus data sesi
    SharedPreferencesHelper.remove(PREF_AUTH);
    SharedPreferencesHelper.remove(PREF_NAME);
    SharedPreferencesHelper.remove(PREF_EMAIL);
    SharedPreferencesHelper.remove(PREF_ID);
    
    // Kembali ke layar login
    Get.offAllNamed('/login');
  }
}
