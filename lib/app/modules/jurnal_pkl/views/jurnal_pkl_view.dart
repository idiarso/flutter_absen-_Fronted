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
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchInitialData,
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.shade50,
                      Colors.white,
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search Bar with Hero Animation
                        Hero(
                          tag: 'searchBar',
                          child: Material(
                            elevation: 2,
                            shadowColor: Colors.black26,
                            borderRadius: BorderRadius.circular(30),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Cari jurnal...',
                                  border: InputBorder.none,
                                  icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Quick Actions Grid with Staggered Animation
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: List.generate(
                            4,
                            (index) => AnimatedScale(
                              scale: 1.0,
                              duration: Duration(milliseconds: 300 + (index * 100)),
                              child: _buildActionCard(
                                title: _getActionTitle(index),
                                icon: _getActionIcon(index),
                                color: _getActionColor(index),
                                onTap: () => _handleActionTap(index),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

  String _getActionTitle(int index) {
    switch (index) {
      case 0:
        return 'Input Kegiatan';
      case 1:
        return 'Riwayat Kegiatan';
      case 2:
        return 'Laporan PKL';
      case 3:
        return 'Info PKL';
      default:
        return '';
    }
  }

  IconData _getActionIcon(int index) {
    switch (index) {
      case 0:
        return Icons.edit_note;
      case 1:
        return Icons.history;
      case 2:
        return Icons.assessment;
      case 3:
        return Icons.info;
      default:
        return Icons.circle;
    }
  }

  Color _getActionColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  void _handleActionTap(int index) {
    switch (index) {
      case 0:
        controller.navigateToInputKegiatan();
        break;
      case 1:
        controller.navigateToRiwayatKegiatan();
        break;
      case 2:
        controller.navigateToLaporanPKL();
        break;
      case 3:
        // Info PKL action
        break;
    }
  }
}
