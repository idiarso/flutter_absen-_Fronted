import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/jurnal_pkl_controller.dart';

class JurnalPKLView extends GetView<JurnalPKLController> {
  const JurnalPKLView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurnal PKL'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: controller.exportToPDF,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari jurnal...',
                            border: InputBorder.none,
                            icon: Icon(Icons.search, color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Quick Actions Grid
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          _buildActionCard(
                            title: 'Input Kegiatan',
                            icon: Icons.edit_note,
                            color: Colors.blue,
                            onTap: controller.navigateToInputKegiatan,
                          ),
                          _buildActionCard(
                            title: 'Riwayat Kegiatan',
                            icon: Icons.history,
                            color: Colors.green,
                            onTap: controller.navigateToRiwayatKegiatan,
                          ),
                          _buildActionCard(
                            title: 'Laporan PKL',
                            icon: Icons.assessment,
                            color: Colors.orange,
                            onTap: controller.navigateToLaporanPKL,
                          ),
                          _buildActionCard(
                            title: 'Info PKL',
                            icon: Icons.info,
                            color: Colors.purple,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      // Recent Activities
                      const Text(
                        'Aktivitas Terbaru',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.jurnalList.length,
                        itemBuilder: (context, index) {
                          final jurnal = controller.jurnalList[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              title: Text(jurnal.kegiatan),
                              subtitle: Text(jurnal.tanggal),
                              trailing: _buildStatusChip(jurnal.status),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToInputKegiatan,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'approved':
        color = Colors.green;
        break;
      case 'rejected':
        color = Colors.red;
        break;
      case 'pending':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(
        status,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }
}
