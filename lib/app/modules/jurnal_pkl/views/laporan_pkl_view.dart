import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jurnal_pkl_controller.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Progress PKL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CircularPercentIndicator(
                            radius: 60,
                            lineWidth: 10,
                            percent: controller.progressPKL.value,
                            center: Text(
                              '${(controller.progressPKL.value * 100).toInt()}%',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            progressColor: Colors.brown,
                            backgroundColor: Colors.brown.withOpacity(0.2),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '${controller.totalHariKerja} Hari Kerja',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Status Jurnal Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Status Jurnal',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildStatusItem(
                            'Disetujui',
                            controller.totalApproved.value,
                            Colors.green,
                          ),
                          const SizedBox(height: 8),
                          _buildStatusItem(
                            'Menunggu',
                            controller.totalPending.value,
                            Colors.orange,
                          ),
                          const SizedBox(height: 8),
                          _buildStatusItem(
                            'Ditolak',
                            controller.totalRejected.value,
                            Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Monthly Progress Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Progress Bulanan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.monthlyProgress.length,
                            itemBuilder: (context, index) {
                              final item = controller.monthlyProgress[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.month,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    LinearPercentIndicator(
                                      lineHeight: 8,
                                      percent: item.progress,
                                      backgroundColor: Colors.brown.withOpacity(0.2),
                                      progressColor: Colors.brown,
                                      barRadius: const Radius.circular(4),
                                      trailing: Text(
                                        '${(item.progress * 100).toInt()}%',
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
