import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import '../../../data/models/jurnal_pkl_model.dart';
import '../../../data/source/pkl_api_service.dart';
import '../../../module/use_case/pkl_get_locations.dart';
import '../../../module/use_case/pkl_get_progress.dart';
import '../../../module/use_case/pkl_get_student.dart';
import '../../../module/use_case/pkl_submit_daily_report.dart';
import '../../../module/use_case/pkl_get_jurnal_list.dart';
import '../../../module/use_case/pkl_get_jurnal_detail.dart';
import '../../../module/use_case/pkl_update_jurnal_status.dart';
import '../../auth/controllers/auth_controller.dart';

class JurnalPKLController extends GetxController {
  final PKLGetLocationsUseCase _getLocationsUseCase;
  final PKLGetStudentUseCase _getStudentUseCase;
  final PKLSubmitDailyReportUseCase _submitDailyReportUseCase;
  final PKLGetProgressUseCase _getProgressUseCase;
  final PKLGetJurnalListUseCase _getJurnalListUseCase;
  final PKLGetJurnalDetailUseCase _getJurnalDetailUseCase;
  final PKLUpdateJurnalStatusUseCase _updateJurnalStatusUseCase;

  final imagePicker = ImagePicker();
  final jurnalList = <JurnalPKL>[].obs;
  final isLoading = false.obs;
  final isLoadingLaporan = false.obs;
  final selectedImage = Rxn<XFile>();
  final progressPKL = 0.0.obs;
  final totalHariKerja = 0.obs;
  final totalApproved = 0.obs;
  final totalPending = 0.obs;
  final totalRejected = 0.obs;
  final studentData = Rxn<PKLStudent>();
  final selectedFilter = 'all'.obs;
  final selectedDate = DateTime.now().obs;

  JurnalPKLController(
    this._getLocationsUseCase,
    this._getStudentUseCase,
    this._submitDailyReportUseCase,
    this._getProgressUseCase,
    this._getJurnalListUseCase,
    this._getJurnalDetailUseCase,
    this._updateJurnalStatusUseCase,
  );

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchInitialData();
  }

  Future<void> fetchInitialData() async {
    try {
      isLoading.value = true;
      await Future.wait([
        fetchJurnalList(),
        fetchProgress(),
        fetchStudentData(),
      ]);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch initial data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProgress() async {
    try {
      final progress = await _getProgressUseCase();
      progressPKL.value = progress.progressPercentage ?? 0.0;
      totalHariKerja.value = progress.totalHariKerja ?? 0;
      totalApproved.value = progress.totalApproved ?? 0;
      totalPending.value = progress.totalPending ?? 0;
      totalRejected.value = progress.totalRejected ?? 0;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch progress: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> fetchStudentData() async {
    try {
      final student = await _getStudentUseCase();
      studentData.value = student;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch student data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void navigateToInputKegiatan() {
    Get.toNamed('${Get.currentRoute}/input-kegiatan');
  }

  void navigateToRiwayatKegiatan() {
    Get.toNamed('${Get.currentRoute}/riwayat-kegiatan');
  }

  void navigateToLaporanPKL() {
    Get.toNamed('${Get.currentRoute}/laporan-pkl');
  }

  Future<void> fetchJurnalList() async {
    try {
      isLoading.value = true;
      final result = await _getJurnalListUseCase();
      jurnalList.assignAll(result);
      filterJurnal(selectedFilter.value);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch jurnal list: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = pickedFile;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> loadJurnalPKL() async {
    return fetchJurnalList();
  }

  void filterJurnal(String status) {
    selectedFilter.value = status;
    if (status == 'all') return;

    final filteredList =
        jurnalList
            .where(
              (jurnal) => jurnal.status.toLowerCase() == status.toLowerCase(),
            )
            .toList();
    jurnalList.assignAll(filteredList);
  }

  Future<void> submitJurnal(String kegiatan, String lokasi) async {
    try {
      isLoading.value = true;

      if (selectedImage.value == null) {
        throw Exception('Please select an image');
      }

      final imageFile = File(selectedImage.value!.path);
      final List<int> imageBytes = await imageFile.readAsBytes();

      await _submitDailyReportUseCase(
        JurnalPKL(
          kegiatan: kegiatan,
          lokasi: lokasi,
          dokumentasi: imageBytes,
          filename: selectedImage.value!.name,
        ),
      );

      Get.snackbar(
        'Success',
        'Jurnal submitted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Reset form
      selectedImage.value = null;
      await fetchJurnalList();

      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to submit jurnal: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> exportToPDF() async {
    try {
      isLoadingLaporan.value = true;

      final pdf = pw.Document();
      final authController = Get.find<AuthController>();
      final dateFormat = DateFormat('dd MMMM yyyy');

      pdf.addPage(
        pw.MultiPage(
          build: (context) => [
            pw.Header(level: 0, child: pw.Text('Laporan PKL')),
            pw.SizedBox(height: 20),
            pw.Text('Nama Siswa: ${authController.user.value!.name}'),
            pw.Text('NIS: ${studentData.value?.nis ?? "-"}'),
            pw.SizedBox(height: 10),
            pw.Text('Tanggal: ${dateFormat.format(DateTime.now())}'),
            pw.SizedBox(height: 20),
            pw.Paragraph(text: 'Progress PKL: ${(progressPKL.value * 100).toInt()}%'),
            pw.Paragraph(text: 'Total Hari Kerja: ${totalHariKerja.value}'),
            pw.SizedBox(height: 20),
            pw.TableHelper.fromTextArray(
              context: context,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              data: <List<String>>[
                ['Tanggal', 'Kegiatan', 'Lokasi', 'Status'],
                ...jurnalList
                    .map(
                      (jurnal) => [
                        dateFormat.format(
                          jurnal.createdAt ?? DateTime.now(),
                        ),
                        jurnal.kegiatan ?? '',
                        jurnal.lokasi ?? '',
                        jurnal.status ?? '',
                      ],
                    )
                    .toList(),
              ],
            ),
          ],
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File('${output.path}/laporan_pkl_${DateFormat('yyyyMMdd').format(DateTime.now())}.pdf');
      await file.writeAsBytes(await pdf.save());

      Get.snackbar(
        'Success',
        'PDF exported successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to export PDF: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoadingLaporan.value = false;
    }
  }
}
