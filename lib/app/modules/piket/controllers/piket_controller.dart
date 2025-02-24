import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/piket_model.dart';
import '../../../module/use_case/piket_use_cases.dart';

class PiketController extends GetxController {
  final GetPiketScheduleUseCase _getScheduleUseCase;
  final GetMyPiketScheduleUseCase _getMyScheduleUseCase;
  final CreatePiketScheduleUseCase _createScheduleUseCase;
  final UpdatePiketScheduleUseCase _updateScheduleUseCase;
  final DeletePiketScheduleUseCase _deleteScheduleUseCase;
  final GetPiketActivitiesUseCase _getActivitiesUseCase;
  final CreatePiketActivityUseCase _createActivityUseCase;
  final UpdatePiketActivityUseCase _updateActivityUseCase;
  final DeletePiketActivityUseCase _deleteActivityUseCase;
  final GetPiketReportsUseCase _getReportsUseCase;
  final GetPiketReportDetailUseCase _getReportDetailUseCase;
  final GeneratePiketReportUseCase _generateReportUseCase;

  PiketController(
    this._getScheduleUseCase,
    this._getMyScheduleUseCase,
    this._createScheduleUseCase,
    this._updateScheduleUseCase,
    this._deleteScheduleUseCase,
    this._getActivitiesUseCase,
    this._createActivityUseCase,
    this._updateActivityUseCase,
    this._deleteActivityUseCase,
    this._getReportsUseCase,
    this._getReportDetailUseCase,
    this._generateReportUseCase,
  );

  // State variables
  final schedules = <PiketSchedule>[].obs;
  final mySchedules = <PiketSchedule>[].obs;
  final activities = <PiketActivity>[].obs;
  final reports = <PiketReport>[].obs;
  final selectedReport = Rxn<PiketReport>();
  final isLoading = false.obs;
  final selectedTab = 0.obs;

  // Form controllers
  final activityController = TextEditingController();
  final notesController = TextEditingController();
  final imagePath = Rxn<String>();
  final imageBytes = Rxn<List<int>>();

  // Filter variables
  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final selectedStatus = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  @override
  void onClose() {
    activityController.dispose();
    notesController.dispose();
    super.onClose();
  }

  Future<void> fetchInitialData() async {
    isLoading.value = true;
    try {
      await Future.wait([
        fetchSchedules(),
        fetchMySchedules(),
        fetchActivities(),
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

  Future<void> fetchSchedules() async {
    try {
      schedules.value = await _getScheduleUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat jadwal piket');
      rethrow;
    }
  }

  Future<void> fetchMySchedules() async {
    try {
      mySchedules.value = await _getMyScheduleUseCase.execute();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat jadwal piket anda');
      rethrow;
    }
  }

  Future<void> createSchedule(PiketSchedule schedule) async {
    try {
      await _createScheduleUseCase.execute(schedule);
      await fetchSchedules();
      Get.back();
      Get.snackbar('Sukses', 'Jadwal piket berhasil dibuat');
    } catch (e) {
      Get.snackbar('Error', 'Gagal membuat jadwal piket');
      rethrow;
    }
  }

  Future<void> updateSchedule(int id, PiketSchedule schedule) async {
    try {
      await _updateScheduleUseCase.execute(id, schedule);
      await fetchSchedules();
      Get.back();
      Get.snackbar('Sukses', 'Jadwal piket berhasil diupdate');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate jadwal piket');
      rethrow;
    }
  }

  Future<void> deleteSchedule(int id) async {
    try {
      await _deleteScheduleUseCase.execute(id);
      await fetchSchedules();
      Get.snackbar('Sukses', 'Jadwal piket berhasil dihapus');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus jadwal piket');
      rethrow;
    }
  }

  Future<void> fetchActivities() async {
    try {
      final formattedStartDate = startDate.value?.toIso8601String();
      final formattedEndDate = endDate.value?.toIso8601String();

      activities.value = await _getActivitiesUseCase.execute(
        startDate: formattedStartDate,
        endDate: formattedEndDate,
        status: selectedStatus.value,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat aktivitas piket');
      rethrow;
    }
  }

  Future<void> createActivity() async {
    if (activityController.text.isEmpty) {
      Get.snackbar('Error', 'Mohon lengkapi aktivitas');
      return;
    }

    try {
      await _createActivityUseCase.execute(
        activity: activityController.text,
        status: 'ongoing',
        documentation: imageBytes.value,
        filename: imagePath.value?.split('/').last,
        notes: notesController.text,
      );

      // Clear form
      activityController.clear();
      notesController.clear();
      imagePath.value = null;
      imageBytes.value = null;

      await fetchActivities();
      Get.back();
      Get.snackbar('Sukses', 'Aktivitas piket berhasil dibuat');
    } catch (e) {
      Get.snackbar('Error', 'Gagal membuat aktivitas piket');
      rethrow;
    }
  }

  Future<void> updateActivity(int id, PiketActivity activity) async {
    try {
      await _updateActivityUseCase.execute(id, activity);
      await fetchActivities();
      Get.back();
      Get.snackbar('Sukses', 'Aktivitas piket berhasil diupdate');
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengupdate aktivitas piket');
      rethrow;
    }
  }

  Future<void> deleteActivity(int id) async {
    try {
      await _deleteActivityUseCase.execute(id);
      await fetchActivities();
      Get.snackbar('Sukses', 'Aktivitas piket berhasil dihapus');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus aktivitas piket');
      rethrow;
    }
  }

  Future<void> fetchReports() async {
    try {
      final formattedStartDate = startDate.value?.toIso8601String();
      final formattedEndDate = endDate.value?.toIso8601String();

      reports.value = await _getReportsUseCase.execute(
        startDate: formattedStartDate,
        endDate: formattedEndDate,
      );
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat laporan piket');
      rethrow;
    }
  }

  Future<void> fetchReportDetail(int id) async {
    try {
      selectedReport.value = await _getReportDetailUseCase.execute(id);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail laporan');
      rethrow;
    }
  }

  Future<void> generateReport() async {
    if (startDate.value == null || endDate.value == null) {
      Get.snackbar('Error', 'Mohon pilih rentang tanggal');
      return;
    }

    try {
      final report = await _generateReportUseCase.execute(
        startDate: startDate.value!.toIso8601String(),
        endDate: endDate.value!.toIso8601String(),
      );

      selectedReport.value = report;
      Get.toNamed('/piket/report-detail');
    } catch (e) {
      Get.snackbar('Error', 'Gagal membuat laporan');
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
  void updateDateRange(DateTime? start, DateTime? end) {
    startDate.value = start;
    endDate.value = end;
    fetchActivities();
  }

  void updateStatus(String? status) {
    selectedStatus.value = status;
    fetchActivities();
  }

  void changeTab(int index) {
    selectedTab.value = index;
    if (index == 2) { // Reports tab
      fetchReports();
    }
  }
}
