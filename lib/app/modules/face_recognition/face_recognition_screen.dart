import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'face_recognition_notifier.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Get.find<FaceRecognitionNotifier>();
    return Scaffold(
      appBar: AppBar(title: const Text('Pengenalan Wajah')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Status verifikasi
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          notifier.isVerified.value
                              ? Colors.green.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color:
                            notifier.isVerified.value
                                ? Colors.green
                                : Colors.grey,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          notifier.isVerified.value
                              ? Icons.check_circle
                              : Icons.info_outline,
                          color:
                              notifier.isVerified.value
                                  ? Colors.green
                                  : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            notifier.verificationMessage.value.isNotEmpty
                                ? notifier.verificationMessage.value
                                : "Silakan ambil foto untuk verifikasi",
                            style: TextStyle(
                              color:
                                  notifier.isVerified.value
                                      ? Colors.green
                                      : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Gambar wajah
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                  ),
                  child: Obx(
                    () =>
                        notifier.currentImage != null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.memory(
                                notifier.currentImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                            : const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    "Belum ada foto",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                  ),
                ),

                const SizedBox(height: 24),

                // Tingkat kemiripan
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        const Text(
                          'Tingkat Kemiripan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value:
                              notifier.percentMatch > 0
                                  ? notifier.percentMatch / 100
                                  : 0,
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            notifier.isVerified.value
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          notifier.percentMatch > 0
                              ? "${notifier.percentMatch.toStringAsFixed(1)}%"
                              : "0%",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                notifier.isVerified.value
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tombol-tombol aksi
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: notifier.getCurrentPhoto,
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Ambil Foto Lagi'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tombol submit presensi
                Obx(
                  () => ElevatedButton.icon(
                    onPressed:
                        notifier.isVerified.value
                            ? notifier.submitAttendance
                            : null,
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Submit Presensi'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
