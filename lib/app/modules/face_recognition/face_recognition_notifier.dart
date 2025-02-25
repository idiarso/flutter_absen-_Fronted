import 'dart:typed_data';
import 'package:skansapung_presensi/app/module/use_case/photo_get_bytes.dart';
import 'package:skansapung_presensi/app/module/use_case/attendance_send.dart';
import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/core/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face_api/flutter_face_api.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class FaceRecognitionNotifier extends AppProvider {
  final PhotoGetBytesUseCase _photoGetBytesUseCase;
  @override
  String errorMessage = '';
  final AttendanceSendUseCase _attendanceSendUseCase =
      Get.find<AttendanceSendUseCase>();

  // Status presensi
  RxBool isVerified = false.obs;
  RxString verificationMessage = "".obs;

  FaceRecognitionNotifier(this._photoGetBytesUseCase) {
    init();
  }

  final FaceSDK _faceSDK = FaceSDK.instance;
  MatchFacesImage? mfImage1;
  MatchFacesImage? mfImage2;
  Uint8List? _currentImage;
  double _percentMatch = 0.0;

  Uint8List? get currentImage => _currentImage;
  double get percentMatch => _percentMatch;

  @override
  void init() async {
    await _faceSDK.initialize(config: null);
    await _getBasePhoto();
    if (errorMessage.isEmpty) getCurrentPhoto();
  }

  _getBasePhoto() async {
    showLoading();
    final response = await _photoGetBytesUseCase();
    if (response.success) {
      _setImage(response.data!, ImageType.PRINTED, 1);
    } else {
      errorMessage = response.message;
    }
    hideLoading();
  }

  _setImage(Uint8List bytes, ImageType type, int flag) {
    final mdImage = MatchFacesImage(bytes, type);
    if (flag == 1) {
      mfImage1 = mdImage;
    } else {
      mfImage2 = mdImage;
      _currentImage = bytes;
    }
  }

  getCurrentPhoto() async {
    _currentImage = null;
    isVerified.value = false;
    verificationMessage.value = "";
    final response = await _faceSDK.startFaceCapture();
    final image = response.image;
    if (image != null) _setImage(image.image, image.imageType, 2);
    if (_currentImage != null) {
      _matchFaces();
    } else {
      notifyListeners();
    }
  }

  _matchFaces() async {
    showLoading();
    _percentMatch = 0.0;
    final request = MatchFacesRequest([mfImage1!, mfImage2!]);
    final response = await _faceSDK.matchFaces(request);
    final split = await _faceSDK.splitComparedFaces(response.results, 0.75);
    final match = split.matchedFaces;
    if (match.isNotEmpty) {
      _percentMatch = match[0].similarity * 100;

      // Update status verifikasi
      if (_percentMatch >= 80) {
        isVerified.value = true;
        verificationMessage.value =
            "Wajah terverifikasi! Silakan lanjutkan presensi.";
      } else {
        isVerified.value = false;
        verificationMessage.value =
            "Verifikasi gagal. Kemiripan tidak mencukupi.";
      }
    } else {
      _percentMatch = -1;
      isVerified.value = false;
      verificationMessage.value =
          "Wajah tidak terdeteksi dengan benar. Coba lagi.";
    }
    hideLoading();
  }

  // Method baru untuk mendapatkan lokasi saat ini
  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi diaktifkan
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      verificationMessage.value =
          'Layanan lokasi tidak aktif. Aktifkan layanan lokasi.';
      return null;
    }

    // Cek izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        verificationMessage.value = 'Izin lokasi ditolak';
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      verificationMessage.value =
          'Izin lokasi ditolak secara permanen. Ubah di pengaturan.';
      return null;
    }

    // Dapatkan posisi saat ini
    return await Geolocator.getCurrentPosition();
  }

  // Method untuk mengirim data presensi
  Future<void> submitAttendance() async {
    if (!isVerified.value) {
      Get.snackbar(
        'Gagal',
        'Verifikasi wajah belum berhasil. Coba lagi.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    showLoading();

    try {
      // Dapatkan lokasi saat ini
      final position = await _getCurrentLocation();
      if (position == null) {
        hideLoading();
        Get.snackbar(
          'Gagal',
          verificationMessage.value,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Siapkan data presensi - tanpa parameter 'photo' karena tidak ada di AttendanceParamEntity
      final attendanceParam = AttendanceParamEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // Kirim data presensi - gunakan call() sebagai metode eksekusi
      final result = await _attendanceSendUseCase.call(param: attendanceParam);

      hideLoading();

      if (result.success) {
        Get.snackbar(
          'Sukses',
          'Presensi berhasil dicatat',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        // Kembali ke halaman home setelah berhasil
        Get.offNamed('/home');
      } else {
        Get.snackbar(
          'Gagal',
          'Gagal mencatat presensi: ${result.message}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      hideLoading();
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
