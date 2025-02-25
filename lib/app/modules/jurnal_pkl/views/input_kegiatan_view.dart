import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jurnal_pkl_controller.dart';

class InputKegiatanView extends GetView<JurnalPKLController> {
  const InputKegiatanView({Key? key}) : super(key: key);

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Pilih Sumber Gambar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Kamera'),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImage();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Galeri'),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImage();
                  },
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final kegiatanController = TextEditingController();
    final lokasiController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Kegiatan PKL'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (kegiatanController.text.isEmpty) {
                Get.snackbar(
                  'Error',
                  'Kegiatan tidak boleh kosong',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                return;
              }

              if (lokasiController.text.isEmpty) {
                Get.snackbar(
                  'Error',
                  'Lokasi tidak boleh kosong',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                return;
              }

              final jurnal = {
                'userId': controller.studentData.value?.id ?? 0,
                'tanggal': DateTime.now().toIso8601String(),
                'kegiatan': kegiatanController.text,
                'lokasi': lokasiController.text,
                'status': 'draft',
                'createdAt': DateTime.now().toIso8601String(),
                'updatedAt': DateTime.now().toIso8601String(),
              };

              controller.submitJurnal(null, jurnal);
            },
          ),
        ],
      ),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Info PKL
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lokasi PKL: ${controller.studentData.value?.lokasi ?? 'Belum ada'}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Pembimbing: ${controller.studentData.value?.pembimbing ?? 'Belum ada'}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tanggal
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tanggal',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () => controller.selectDate(context),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 8),
                                      Text(controller.selectedDate.value),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Kegiatan
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kegiatan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: kegiatanController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  hintText: 'Tuliskan kegiatan hari ini...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Lokasi
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Lokasi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: lokasiController,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan lokasi kegiatan...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Dokumentasi
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Dokumentasi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Obx(
                                () =>
                                    controller.selectedImage.value == null
                                        ? Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add_a_photo,
                                                  ),
                                                  onPressed:
                                                      () =>
                                                          _showImageSourceDialog(
                                                            context,
                                                          ),
                                                ),
                                                const Text('Tambah Foto'),
                                              ],
                                            ),
                                          ),
                                        )
                                        : Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Image.file(
                                              File(
                                                controller
                                                    .selectedImage
                                                    .value!
                                                    .path,
                                              ),
                                              width: double.infinity,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              onPressed:
                                                  () =>
                                                      controller
                                                          .selectedImage
                                                          .value = null,
                                            ),
                                          ],
                                        ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Submit Button
                      ElevatedButton(
                        onPressed: () {
                          if (kegiatanController.text.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Kegiatan tidak boleh kosong',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (lokasiController.text.isEmpty) {
                            Get.snackbar(
                              'Error',
                              'Lokasi tidak boleh kosong',
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          controller.submitJurnal();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Simpan Kegiatan',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
