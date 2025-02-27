import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jurnal_pkl_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LaporanPKLView extends GetView<JurnalPKLController> {
  const LaporanPKLView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan PKL'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () => controller.exportToPDF(),
          ),
        ],
      ),
      body: Obx(() => controller.isLoadingLaporan.value
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.brown.shade50,
                    Colors.white,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progress Card with Animation
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text(
                                'Progress PKL',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              TweenAnimationBuilder<double>(
                                tween: Tween<double>(
                                  begin: 0,
                                  end: controller.progressPKL.value,
                                ),
                                duration: const Duration(milliseconds: 1500),
                                builder: (context, value, child) {
                                  return CircularPercentIndicator(
                                    radius: 80,
                                    lineWidth: 12,
                                    percent: value,
                                    center: Text(
                                      '${(value * 100).toInt()}%',
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    progressColor: Colors.brown,
                                    backgroundColor: Colors.brown.withAlpha(51),
                                    animation: true,
                                    animationDuration: 1500,
                                    circularStrokeCap: CircularStrokeCap.round,
                                  );
                                },
                              ),
                              const SizedBox(height: 24),
                              Text(
                                '${controller.totalHariKerja} Hari Kerja',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Status Jurnal Card with Animation
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Status Jurnal',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildStatusItem(
                                'Disetujui',
                                controller.totalApproved.value,
                                Colors.green,
                              ),
                              const SizedBox(height: 16),
                              _buildStatusItem(
                                'Menunggu',
                                controller.totalPending.value,
                                Colors.orange,
                              ),
                              const SizedBox(height: 16),
                              _buildStatusItem(
                                'Ditolak',
                                controller.totalRejected.value,
                                Colors.red,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }

  Widget _buildStatusItem(String label, int count, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
        const Spacer(),
        Text(
          count.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
