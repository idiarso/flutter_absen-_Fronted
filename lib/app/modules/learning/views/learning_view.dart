import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/learning_controller.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembelajaran'), centerTitle: true),
      body: Obx(
        () =>
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                  onRefresh: controller.fetchData,
                  child:
                      controller.error.value != null
                          ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Error: ${controller.error.value}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.red),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: controller.fetchData,
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          )
                          : SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildProgressSection(),
                                  const SizedBox(height: 24),
                                  _buildActivitiesList(),
                                ],
                              ),
                            ),
                          ),
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/learning/create'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProgressSection() {
    final progress = controller.progress.value;
    if (progress == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Progress Pembelajaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress.progressPercentage / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(Get.context!).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${progress.completedActivities} dari ${progress.totalActivities} aktivitas selesai',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitiesList() {
    final activities = controller.activities;
    if (activities.isEmpty) {
      return const Center(
        child: Text(
          'Belum ada aktivitas pembelajaran',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            title: Text(activity.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(activity.description),
                const SizedBox(height: 4),
                Text(
                  'Status: ${activity.status}',
                  style: TextStyle(
                    color: _getStatusColor(activity.status),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed:
                  () => Get.toNamed('/learning/detail', arguments: activity),
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in_progress':
        return Colors.orange;
      case 'not_started':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
