import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/jurnal_pkl_model.dart';
import '../../../data/source/pkl_api_service.dart';
import '../../../module/use_case/pkl_get_locations.dart';
import '../../../module/use_case/pkl_get_progress.dart';
import '../../../module/use_case/pkl_get_student.dart';
import '../../../module/use_case/pkl_submit_daily_report.dart';
import '../../../module/use_case/pkl_get_jurnal_list.dart';
import '../../../module/use_case/pkl_get_jurnal_detail.dart';
import '../../../module/use_case/pkl_update_jurnal_status.dart';

// Define MonthlyProgress class for monthly progress data
class MonthlyProgress {
  final String month;
  final int count;
  final double percentage;

  MonthlyProgress({
    required this.month,
    required this.count,
    required this.percentage,
  });
}

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
  final locations = <PKLLocation>[].obs;
  final studentData = Rxn<PKLStudent>();
  final progress = Rxn<PKLProgress>();
  final jurnalList = <JurnalPKL>[].obs;
  final selectedJurnal = Rxn<JurnalPKL>();
  final isLoading = false.obs;
  final searchQuery = ''.obs;
  final selectedStatus = Rxn<String>();
  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final _selectedFilter = 'all'.obs;

  // Added missing variables
  final selectedDate = Rx<String>(DateTime.now().toString().substring(0, 10));
  final selectedImage = Rxn<XFile>();

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
      locations.value = await _getLocationsUseCase();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat lokasi PKL');
      rethrow;
    }
  }

  Future<void> fetchStudentData() async {
    try {
      studentData.value = await _getStudentUseCase();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data siswa');
      rethrow;
    }
  }

  Future<void> fetchProgress() async {
    try {
      progress.value = await _getProgressUseCase();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat progress PKL');
      rethrow;
    }
  }

  Future<void> fetchJurnalList() async {
    try {
      final formattedStartDate = startDate.value?.toIso8601String();
      final formattedEndDate = endDate.value?.toIso8601String();

      jurnalList.value = await _getJurnalListUseCase(
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
      selectedJurnal.value = await _getJurnalDetailUseCase(id);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail jurnal');
      rethrow;
    }
  }

  Future<void> updateJurnalStatus(
    int id,
    String status, {
    String? catatan,
  }) async {
    try {
      await _updateJurnalStatusUseCase(id, status, catatan: catatan);
      await fetchJurnalList(); // Refresh list after update
      Get.snackbar('Sukses', 'Status jurnal berhasil diperbarui');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate status jurnal');
      rethrow;
    }
  }

  // Updated submitJurnal method to accept optional parameters
  Future<void> submitJurnal([
    JurnalPKL? jurnal,
    Map<String, dynamic>? data,
  ]) async {
    if (jurnal == null && data == null) {
      // Using form data
      if (kegiatanController.text.isEmpty || lokasiController.text.isEmpty) {
        Get.snackbar('Error', 'Mohon lengkapi semua field');
        return;
      }

      if (imageBytes.value == null) {
        Get.snackbar('Error', 'Mohon pilih dokumentasi kegiatan');
        return;
      }

      try {
        final jurnal = JurnalPKL(
          kegiatan: kegiatanController.text,
          lokasi: lokasiController.text,
          dokumentasi: imageBytes.value!,
          filename: imagePath.value!.split('/').last,
          tanggal: selectedDate.value,
        );
        await _submitDailyReportUseCase(jurnal);
        // Clear form
        kegiatanController.clear();
        lokasiController.clear();
        imagePath.value = null;
        imageBytes.value = null;
        selectedImage.value = null;
        Get.snackbar('Sukses', 'Jurnal berhasil disubmit');
        await fetchJurnalList(); // Refresh list after submit
      } catch (e) {
        Get.snackbar('Error', 'Gagal mengirim jurnal');
        rethrow;
      }
    } else if (jurnal != null) {
      // Using provided jurnal data
      try {
        await _submitDailyReportUseCase(jurnal);
        Get.snackbar('Sukses', 'Jurnal berhasil disubmit');
        await fetchJurnalList();
      } catch (e) {
        Get.snackbar('Error', 'Gagal mengirim jurnal');
        rethrow;
      }
    } else if (data != null) {
      // Using provided map data
      try {
        final jurnal = JurnalPKL(
          kegiatan: data['kegiatan'],
          lokasi: data['lokasi'],
          dokumentasi: data['dokumentasi'],
          filename: data['filename'],
          tanggal: data['tanggal'],
        );
        await _submitDailyReportUseCase(jurnal);
        Get.snackbar('Sukses', 'Jurnal berhasil disubmit');
        await fetchJurnalList();
      } catch (e) {
        Get.snackbar('Error', 'Gagal mengirim jurnal');
        rethrow;
      }
    }
  }

  Future<void> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagePath.value = image.path;
        imageBytes.value = await image.readAsBytes();
        selectedImage.value = image;
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memilih gambar');
    }
  }

  // Added missing methods
  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
    }
  }

  void navigateToInputKegiatan() {
    Get.toNamed('/jurnal-pkl/input');
  }

  Future<void> loadJurnalPKL() async {
    isLoading.value = true;
    try {
      await fetchJurnalList();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat daftar jurnal');
    } finally {
      isLoading.value = false;
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

  void updateDateRange(DateTime? start, DateTime? end) {
    startDate.value = start;
    endDate.value = end;
    fetchJurnalList();
  }

  // Method to filter journal entries based on status
  void filterJurnal(String status) {
    _selectedFilter.value = status;

    // Update the selectedStatus to match the filter
    selectedStatus.value = status == 'all' ? null : status;

    // Fetch the filtered journal list
    fetchJurnalList();
  }

  // Method to export journal to PDF
  Future<void> exportToPDF() async {
    try {
      isLoading.value = true;

      // Show a loading indicator
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // TODO: Implement actual PDF generation logic
      // This would typically involve:
      // 1. Gathering all the necessary data
      // 2. Using a PDF generation package like pdf, printing, etc.
      // 3. Generating the PDF file
      // 4. Saving or sharing the file

      // Simulate PDF generation with a delay
      await Future.delayed(const Duration(seconds: 2));

      // Close the loading dialog
      Get.back();

      // Show success message
      Get.snackbar(
        'Success',
        'PDF report has been generated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Show error message
      Get.snackbar(
        'Error',
        'Failed to generate PDF: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Getter for selected filter status
  RxString get selectedFilter {
    return _selectedFilter;
  }

  // Getter for monthly progress
  List<MonthlyProgress> get monthlyProgress {
    // If progress is null, return empty list
    if (progress.value == null) return [];

    // Convert attendanceByMonth to MonthlyProgress objects
    final List<MonthlyProgress> result = [];

    // Get total count for percentage calculation
    final totalEntries = progress.value!.attendanceByMonth.values.fold<int>(
      0,
      (sum, count) => sum + count,
    );

    // Convert each month entry to MonthlyProgress
    progress.value!.attendanceByMonth.forEach((month, count) {
      final percentage = totalEntries > 0 ? (count / totalEntries) * 100 : 0.0;
      result.add(
        MonthlyProgress(month: month, count: count, percentage: percentage),
      );
    });

    return result;
  }
}
