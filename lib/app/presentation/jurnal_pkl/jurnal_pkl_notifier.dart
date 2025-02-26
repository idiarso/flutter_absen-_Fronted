import 'package:flutter/material.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/core/provider/app_provider.dart';

class JurnalPKLNotifier extends AppProvider {
  String userName = '';

  @override
  Future<void> init() async {
    userName = await SharedPreferencesHelper.getUserName() ?? '';
    notifyListeners();
  }

  void navigateToInputKegiatan() {
    navigator.pushNamed('/jurnal-pkl/input');
  }

  void navigateToRiwayatKegiatan() {
    navigator.pushNamed('/jurnal-pkl/riwayat');
  }

  void navigateToLaporanPKL() {
    navigator.pushNamed('/jurnal-pkl/laporan');
  }

  void navigateToInfoPKL() {
    navigator.pushNamed('/jurnal-pkl/info');
  }

  void navigateToPembimbing() {
    navigator.pushNamed('/jurnal-pkl/pembimbing');
  }

  void navigateToJadwal() {
    navigator.pushNamed('/jurnal-pkl/jadwal');
  }

  void navigateToLainnya() {
    // TODO: Implement menu lainnya
    showSnackBar('Menu lainnya akan segera tersedia');
  }

  Future<void> exportToPDF() async {
    try {
      showLoading();
      // TODO: Implement PDF export
      await Future.delayed(const Duration(seconds: 2)); // Simulate process
      hideLoading();
      showSnackBar('Export PDF akan segera tersedia');
    } catch (e) {
      hideLoading();
      showSnackBar('Gagal mengekspor PDF: $e');
    }
  }
}
