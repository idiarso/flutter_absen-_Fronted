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
import '../../auth/controllers/auth_controller.dart';

class JurnalPKLController extends GetxController {
  final PKLApiService _pklApiService;
  final imagePicker = ImagePicker();
  final jurnalList = <JurnalPKL>[].obs;
  final isLoading = false.obs;
  final selectedImage = Rxn<XFile>();
  
  JurnalPKLController(this._pklApiService);

  @override
  void onInit() {
    super.onInit();
    fetchJurnalList();
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
      final result = await _pklApiService.getJurnalList();
      jurnalList.assignAll(result);
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

  Future<void> submitJurnal(String kegiatan, String lokasi) async {
    try {
      isLoading.value = true;
      
      if (selectedImage.value == null) {
        throw Exception('Please select an image');
      }

      await _pklApiService.submitJurnal(
        kegiatan: kegiatan,
        lokasi: lokasi,
        imagePath: selectedImage.value!.path,
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

  Future<void> generatePDF() async {
    try {
      isLoading.value = true;
      
      final pdf = pw.Document();
      final authController = Get.find<AuthController>();

      pdf.addPage(
        pw.MultiPage(
          build: (context) => [
            pw.Header(
              level: 0,
              child: pw.Text('Jurnal PKL Report'),
            ),
            pw.SizedBox(height: 20),
            pw.Text('Nama Siswa: ${authController.user.value?.name ?? ""}'),
            pw.SizedBox(height: 10),
            pw.Text('Tanggal: ${DateFormat('dd MMMM yyyy').format(DateTime.now())}'),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              context: context,
              data: <List<String>>[
                ['Tanggal', 'Kegiatan', 'Lokasi'],
                ...jurnalList.map((jurnal) => [
                  DateFormat('dd/MM/yyyy').format(jurnal.createdAt ?? DateTime.now()),
                  jurnal.kegiatan ?? '',
                  jurnal.lokasi ?? '',
                ]).toList(),
              ],
            ),
          ],
        ),
      );

      final output = await getTemporaryDirectory();
      final file = File('${output.path}/jurnal_pkl_report.pdf');
      await file.writeAsBytes(await pdf.save());

      Get.snackbar(
        'Success',
        'PDF generated successfully at ${file.path}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to generate PDF: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
