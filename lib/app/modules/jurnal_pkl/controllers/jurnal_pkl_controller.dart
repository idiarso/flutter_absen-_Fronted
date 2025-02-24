import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/jurnal_pkl_model.dart';
import '../../../module/use_case/pkl_get_locations.dart';
import '../../../module/use_case/pkl_get_progress.dart';
import '../../../module/use_case/pkl_get_student.dart';
import '../../../module/use_case/pkl_submit_daily_report.dart';
import '../../../module/use_case/pkl_get_jurnal_list.dart';
import '../../../module/use_case/pkl_get_jurnal_detail.dart';
import '../../../module/use_case/pkl_update_jurnal_status.dart';

class JurnalPKLController extends GetxController {
  final PKLGetLocationsUseCase _getLocationsUseCase;
  final PKLGetStudentUseCase _getStudentUseCase;
  final PKLSubmitDailyReportUseCase _submitDailyReportUseCase;
  final PKLGetProgressUseCase _getProgressUseCase;
  final PKLGetJurnalListUseCase _getJurnalListUseCase;
  final PKLGetJurnalDetailUseCase _getJurnalDetailUseCase;
  final PKLUpdateJurnalStatusUseCase _updateJurnalStatusUseCase;

  JurnalPKLController(
    this._getLocationsUseCase,
    this._getStudentUseCase,
    this._submitDailyReportUseCase,
    this._getProgressUseCase,
    this._getJurnalListUseCase,
    this._getJurnalDetailUseCase,
    this._updateJurnalStatusUseCase,
  );

  // State variables
  final locations = <Map<String, dynamic>>[].obs;
  final studentData = Rxn<Map<String, dynamic>>();
  final progress = Rxn<Map<String, dynamic>>();
  final jurnalList = <JurnalPKL>[].obs;
  final selectedJurnal = Rxn<JurnalPKL>();
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final selectedStatus = Rxn<String>();
  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  // Form controllers
  final kegiatanController = TextEditingController();
  final lokasiController = TextEditingController();
  final imagePath = Rxn<String>();
  final imageBytes = Rxn<List<int>>();

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  @override
  void onClose() {
    kegiatanController.dispose();
    lokasiController.dispose();
    super.onClose();
  }

  Future<void> fetchInitialData() async {
    isLoading.value = true;
    try {
      await Future.wait([
        fetchLocations(),
        fetchStudentData(),
        fetchProgress(),
        fetchJurnalList(),
      ]);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal memuat data: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchLocations() async {
    try {
      locations.value = await _getLocationsUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat lokasi PKL');
      rethrow;
    }
  }

  Future<void> fetchStudentData() async {
    try {
      studentData.value = await _getStudentUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data siswa');
      rethrow;
    }
  }

  Future<void> fetchProgress() async {
    try {
      progress.value = await _getProgressUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat progress PKL');
      rethrow;
    }
  }

  Future<void> fetchJurnalList() async {
    try {
      final formattedStartDate = startDate.value?.toIso8601String();
      final formattedEndDate = endDate.value?.toIso8601String();
      
      jurnalList.value = await _getJurnalListUseCase.execute(
        search: searchQuery.value,
        status: selectedStatus.value,
        startDate: formattedStartDate,
        endDate: formattedEndDate,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat daftar jurnal');
      rethrow;
    }
  }

  Future<void> fetchJurnalDetail(int id) async {
    try {
      selectedJurnal.value = await _getJurnalDetailUseCase.execute(id);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail jurnal');
      rethrow;
    }
  }

  Future<void> updateJurnalStatus(int id, String status, {String? catatan}) async {
    try {
      await _updateJurnalStatusUseCase.execute(id, status, catatan: catatan);
      await fetchJurnalList(); // Refresh list after update
      Get.snackbar('Sukses', 'Status jurnal berhasil diperbarui');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate status jurnal');
      rethrow;
    }
  }

  Future<void> submitJurnal() async {
    if (kegiatanController.text.isEmpty || lokasiController.text.isEmpty) {
      Get.snackbar('Error', 'Mohon lengkapi semua field');
      return;
    }

    if (imageBytes.value == null) {
      Get.snackbar('Error', 'Mohon pilih dokumentasi kegiatan');
      return;
    }

    try {
      await _submitDailyReportUseCase.execute(
        kegiatan: kegiatanController.text,
        lokasi: lokasiController.text,
        dokumentasi: imageBytes.value!,
        filename: imagePath.value!.split('/').last,
      );
      
      // Clear form
      kegiatanController.clear();
      lokasiController.clear();
      imagePath.value = null;
      imageBytes.value = null;
      
      Get.snackbar('Sukses', 'Jurnal berhasil disubmit');
      await fetchJurnalList(); // Refresh list after submit
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengirim jurnal');
      rethrow;
    }
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      
      if (image != null) {
        imagePath.value = image.path;
        imageBytes.value = await image.readAsBytes();
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memilih gambar');
    }
  }

  // Filter methods
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    fetchJurnalList();
  }

  void updateStatusFilter(String? status) {
    selectedStatus.value = status;
    fetchJurnalList();
  }

  Future<void> updateDateRange(DateTime? start, DateTime? end) async {
    startDate.value = start;
    endDate.value = end;
    await fetchJurnalList();
  }
}
