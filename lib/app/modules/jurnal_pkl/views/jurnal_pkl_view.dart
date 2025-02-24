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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchInitialData,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return Column(
          children: [
            _buildQuickStats(),
            _buildFilters(),
            Expanded(child: _buildJurnalList()),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showInputDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Obx(() {
      final progress = controller.progress.value;
      if (progress == null) return const SizedBox.shrink();

      return Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatCard('Total', progress['total']?.toString() ?? '0', Colors.blue),
            _buildStatCard('Disetujui', progress['approved']?.toString() ?? '0', Colors.green),
            _buildStatCard('Pending', progress['pending']?.toString() ?? '0', Colors.orange),
            _buildStatCard('Ditolak', progress['rejected']?.toString() ?? '0', Colors.red),
          ],
        ),
      );
    });
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(color: color)),
            Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Cari jurnal...',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: controller.updateSearchQuery,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: controller.selectedStatus.value,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Semua')),
                    DropdownMenuItem(value: 'draft', child: Text('Draft')),
                    DropdownMenuItem(value: 'submitted', child: Text('Submitted')),
                    DropdownMenuItem(value: 'approved', child: Text('Approved')),
                    DropdownMenuItem(value: 'rejected', child: Text('Rejected')),
                  ],
                  onChanged: controller.updateStatusFilter,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () => _showDateRangePicker(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJurnalList() {
    return Obx(() {
      final jurnals = controller.jurnalList;
      if (jurnals.isEmpty) {
        return const Center(child: Text('Tidak ada jurnal'));
      }

      return ListView.builder(
        itemCount: jurnals.length,
        itemBuilder: (context, index) {
          final jurnal = jurnals[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(jurnal.kegiatan),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lokasi: ${jurnal.lokasi}'),
                  Text('Tanggal: ${jurnal.tanggal}'),
                ],
              ),
              trailing: _buildStatusChip(jurnal.status),
              onTap: () => _showDetailDialog(context, jurnal.id!),
            ),
          );
        },
      );
    });
  }

  Widget _buildStatusChip(String status) {
    Color color;
    switch (status) {
      case 'approved':
        color = Colors.green;
        break;
      case 'rejected':
        color = Colors.red;
        break;
      case 'submitted':
        color = Colors.orange;
        break;
      default:
        color = Colors.grey;
    }

    return Chip(
      label: Text(
        status.toUpperCase(),
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
    );
  }

  Future<void> _showInputDialog(BuildContext context) async {
    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.kegiatanController,
                decoration: const InputDecoration(
                  labelText: 'Kegiatan',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: controller.lokasiController.text.isEmpty ? null : controller.lokasiController.text,
                decoration: const InputDecoration(
                  labelText: 'Lokasi',
                ),
                items: controller.locations
                    .map((location) => DropdownMenuItem(
                          value: location['name'].toString(),
                          child: Text(location['name'].toString()),
                        ))
                    .toList(),
                onChanged: (value) => controller.lokasiController.text = value ?? '',
              ),
              const SizedBox(height: 16),
              Obx(() => controller.imagePath.value != null
                  ? Text('File: ${controller.imagePath.value!.split('/').last}')
                  : const SizedBox.shrink()),
              ElevatedButton.icon(
                icon: const Icon(Icons.photo),
                label: const Text('Pilih Dokumentasi'),
                onPressed: controller.pickImage,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text('Batal'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.submitJurnal();
                      Get.back();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDetailDialog(BuildContext context, int id) async {
    await controller.fetchJurnalDetail(id);
    
    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final jurnal = controller.selectedJurnal.value;
            if (jurnal == null) return const CircularProgressIndicator();

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Kegiatan:', style: Theme.of(context).textTheme.titleMedium),
                Text(jurnal.kegiatan),
                const SizedBox(height: 8),
                Text('Lokasi:', style: Theme.of(context).textTheme.titleMedium),
                Text(jurnal.lokasi ?? '-'),
                const SizedBox(height: 8),
                Text('Status:', style: Theme.of(context).textTheme.titleMedium),
                _buildStatusChip(jurnal.status),
                if (jurnal.catatan != null) ...[
                  const SizedBox(height: 8),
                  Text('Catatan:', style: Theme.of(context).textTheme.titleMedium),
                  Text(jurnal.catatan!),
                ],
                const SizedBox(height: 8),
                if (jurnal.dokumentasi != null)
                  Image.network(
                    jurnal.dokumentasi!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Future<void> _showDateRangePicker(BuildContext context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    );

    if (result != null) {
      controller.updateDateRange(result.start, result.end);
    }
  }
}
