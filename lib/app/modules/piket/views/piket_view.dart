import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/piket_controller.dart';
import '../../../data/models/piket_model.dart';

class PiketView extends GetView<PiketController> {
  const PiketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piket Guru'),
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

        return DefaultTabController(
          length: 3,
          initialIndex: controller.selectedTab.value,
          child: Column(
            children: [
              TabBar(
                onTap: controller.changeTab,
                tabs: const [
                  Tab(text: 'Jadwal'),
                  Tab(text: 'Kegiatan'),
                  Tab(text: 'Laporan'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildScheduleTab(),
                    _buildActivityTab(),
                    _buildReportTab(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.selectedTab.value == 1) {
          return FloatingActionButton(
            onPressed: () => _showActivityInputDialog(context),
            child: const Icon(Icons.add),
          );
        }
        return const SizedBox.shrink();
      }),
    );
  }

  Widget _buildScheduleTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Jadwal Piket Saya', style: Get.textTheme.titleLarge),
          const SizedBox(height: 16),
          Obx(() {
            if (controller.mySchedules.isEmpty) {
              return const Center(child: Text('Tidak ada jadwal piket'));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.mySchedules.length,
              itemBuilder: (context, index) {
                final schedule = controller.mySchedules[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.schedule),
                    title: Text('Hari ${schedule.day}'),
                    subtitle: Text('Shift: ${schedule.shift}'),
                    trailing:
                        schedule.notes != null
                            ? IconButton(
                              icon: const Icon(Icons.info),
                              onPressed:
                                  () => Get.snackbar(
                                    'Catatan',
                                    schedule.notes!,
                                    duration: const Duration(seconds: 3),
                                  ),
                            )
                            : null,
                  ),
                );
              },
            );
          }),
          const SizedBox(height: 32),
          Text('Semua Jadwal Piket', style: Get.textTheme.titleLarge),
          const SizedBox(height: 16),
          Obx(() {
            if (controller.schedules.isEmpty) {
              return const Center(child: Text('Tidak ada jadwal piket'));
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.schedules.length,
              itemBuilder: (context, index) {
                final schedule = controller.schedules[index];
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.schedule),
                    title: Text('Hari ${schedule.day}'),
                    subtitle: Text('Shift: ${schedule.shift}'),
                    trailing:
                        schedule.notes != null
                            ? IconButton(
                              icon: const Icon(Icons.info),
                              onPressed:
                                  () => Get.snackbar(
                                    'Catatan',
                                    schedule.notes!,
                                    duration: const Duration(seconds: 3),
                                  ),
                            )
                            : null,
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    return Column(
      children: [
        _buildActivityFilters(),
        Expanded(
          child: Obx(() {
            if (controller.activities.isEmpty) {
              return const Center(child: Text('Tidak ada kegiatan piket'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.activities.length,
              itemBuilder: (context, index) {
                final activity = controller.activities[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(activity.activity),
                        subtitle: Text(
                          'Status: ${activity.status}\nTanggal: ${activity.date}',
                        ),
                        trailing: _buildActivityMenu(activity),
                      ),
                      if (activity.documentation != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.network(
                            activity.documentation!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (activity.notes != null)
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Catatan: ${activity.notes}',
                            style: Get.textTheme.bodyMedium,
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildActivityFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: controller.selectedStatus.value,
                  decoration: const InputDecoration(labelText: 'Status'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Semua')),
                    DropdownMenuItem(
                      value: 'ongoing',
                      child: Text('Berlangsung'),
                    ),
                    DropdownMenuItem(
                      value: 'completed',
                      child: Text('Selesai'),
                    ),
                  ],
                  onChanged: controller.updateStatus,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.date_range),
                onPressed: () => _showDateRangePicker(Get.context!),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add_chart),
                  label: const Text('Buat Laporan'),
                  onPressed: () => _showReportDialog(Get.context!),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (controller.reports.isEmpty) {
              return const Center(child: Text('Tidak ada laporan'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.reports.length,
              itemBuilder: (context, index) {
                final report = controller.reports[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      'Laporan ${report.startDate.toString().substring(0, 10)} - ${report.endDate.toString().substring(0, 10)}',
                    ),
                    subtitle: Text(
                      'Total Kegiatan: ${report.totalActivities}\nSelesai: ${report.completedActivities}\nPersentase: ${(report.completionRate * 100).toStringAsFixed(1)}%',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: () async {
                        await controller.fetchReportDetail(report.id);
                        Get.toNamed('/piket/report-detail');
                      },
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  PopupMenuButton<String> _buildActivityMenu(PiketActivity activity) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'edit':
            _showActivityEditDialog(Get.context!, activity);
            break;
          case 'delete':
            _showDeleteConfirmation(Get.context!, activity);
            break;
          case 'complete':
            _updateActivityStatus(activity, 'completed');
            break;
        }
      },
      itemBuilder:
          (context) => [
            if (activity.status == 'ongoing')
              const PopupMenuItem(value: 'complete', child: Text('Selesai')),
            const PopupMenuItem(value: 'edit', child: Text('Edit')),
            const PopupMenuItem(value: 'delete', child: Text('Hapus')),
          ],
    );
  }

  Future<void> _showActivityInputDialog(BuildContext context) async {
    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.activityController,
                decoration: const InputDecoration(labelText: 'Kegiatan'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.notesController,
                decoration: const InputDecoration(
                  labelText: 'Catatan (opsional)',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              Obx(
                () =>
                    controller.imagePath.value != null
                        ? Text(
                          'File: ${controller.imagePath.value!.split('/').last}',
                        )
                        : const SizedBox.shrink(),
              ),
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
                      controller.createActivity();
                      Get.back();
                    },
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showActivityEditDialog(
    BuildContext context,
    PiketActivity activity,
  ) async {
    controller.activityController.text = activity.activity;
    controller.notesController.text = activity.notes ?? '';

    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.activityController,
                decoration: const InputDecoration(labelText: 'Kegiatan'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.notesController,
                decoration: const InputDecoration(
                  labelText: 'Catatan (opsional)',
                ),
                maxLines: 2,
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
                      final updatedActivity = PiketActivity(
                        id: activity.id,
                        userId: activity.userId,
                        date: activity.date,
                        activity: controller.activityController.text,
                        status: activity.status,
                        documentation: activity.documentation,
                        notes: controller.notesController.text,
                        createdAt: activity.createdAt,
                        updatedAt: DateTime.now(),
                      );
                      controller.updateActivity(activity.id, updatedActivity);
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    PiketActivity activity,
  ) async {
    await Get.dialog(
      AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Anda yakin ingin menghapus kegiatan ini?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              controller.deleteActivity(activity.id);
              Get.back();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _updateActivityStatus(PiketActivity activity, String status) {
    final updatedActivity = PiketActivity(
      id: activity.id,
      userId: activity.userId,
      date: activity.date,
      activity: activity.activity,
      status: status,
      documentation: activity.documentation,
      notes: activity.notes,
      createdAt: activity.createdAt,
      updatedAt: DateTime.now(),
    );
    controller.updateActivity(activity.id, updatedActivity);
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

  Future<void> _showReportDialog(BuildContext context) async {
    await Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Buat Laporan Piket',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Pilih rentang tanggal untuk membuat laporan piket'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => _showDateRangePicker(context),
                    child: const Text('Pilih Tanggal'),
                  ),
                  ElevatedButton(
                    onPressed: controller.generateReport,
                    child: const Text('Buat Laporan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
