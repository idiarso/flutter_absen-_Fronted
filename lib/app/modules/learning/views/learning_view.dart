import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/learning_controller.dart';
import '../../../data/models/learning_model.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelajaran'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: controller.loadData,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProgressSection(),
                        const SizedBox(height: 24),
                        _buildActivitiesSection(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create activity
        },
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress.completedActivities / progress.totalActivities,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(Get.context!).primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${progress.completedActivities} dari ${progress.totalActivities} aktivitas selesai',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  'Rata-rata Nilai',
                  '${progress.averageScore.toStringAsFixed(1)}',
                  Icons.grade,
                ),
                _buildStatCard(
                  'Jenis Selesai',
                  '${progress.completedTypes.length}',
                  Icons.check_circle,
                ),
                _buildStatCard(
                  'Total Aktivitas',
                  '${progress.totalActivities}',
                  Icons.assignment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(Get.context!).primaryColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Aktivitas Pembelajaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.activities.length,
          itemBuilder: (context, index) {
            final activity = controller.activities[index];
            return _buildActivityCard(activity);
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard(LearningActivity activity) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to activity detail
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      activity.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusChip(activity.status),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                activity.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tenggat: ${_formatDate(activity.dueDate)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  if (activity.score != null)
                    Text(
                      'Nilai: ${activity.score!.toStringAsFixed(1)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String text;

    switch (status.toLowerCase()) {
      case 'completed':
        color = Colors.green;
        text = 'Selesai';
        break;
      case 'in_progress':
        color = Colors.orange;
        text = 'Sedang Dikerjakan';
        break;
      case 'pending':
        color = Colors.grey;
        text = 'Belum Dikerjakan';
        break;
      default:
        color = Colors.grey;
        text = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
