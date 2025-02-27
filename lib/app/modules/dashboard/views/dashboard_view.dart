import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../data/models/dashboard_model.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: controller.loadData,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummarySection(),
                        const SizedBox(height: 24),
                        _buildRecentActivitiesSection(),
                        const SizedBox(height: 24),
                        _buildStatisticsSection(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildSummarySection() {
    final summary = controller.summary.value;
    if (summary == null) return const SizedBox();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProgressCard(
                  'Presensi',
                  summary.presencePercentage,
                  Icons.calendar_today,
                  Colors.blue,
                ),
                _buildProgressCard(
                  'Pembelajaran',
                  summary.learningProgress,
                  Icons.school,
                  Colors.green,
                ),
                _buildProgressCard(
                  'PKL',
                  summary.pklProgress,
                  Icons.work,
                  Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(
    String title,
    double percentage,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            '${(percentage * 100).toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          itemCount: controller.recentActivities.length,
          itemBuilder: (context, index) {
            final activity = controller.recentActivities[index];
            return _buildActivityCard(activity);
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard(RecentActivity activity) {
    IconData icon;
    Color color;

    switch (activity.type.toLowerCase()) {
      case 'presence':
        icon = Icons.calendar_today;
        color = Colors.blue;
        break;
      case 'learning':
        icon = Icons.school;
        color = Colors.green;
        break;
      case 'pkl':
        icon = Icons.work;
        color = Colors.orange;
        break;
      default:
        icon = Icons.circle;
        color = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          activity.title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            activity.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black54, height: 1.2),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _formatDate(activity.timestamp),
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    final stats = controller.statistics.value;
    if (stats == null) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Statistik',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildStatRow(
                  'Presensi per Hari',
                  stats.presenceByDay.values.reduce((a, b) => a + b).toString(),
                  Icons.calendar_today,
                  Colors.blue,
                ),
                const Divider(),
                _buildStatRow(
                  'Rata-rata Nilai',
                  stats.learningScores.values
                      .reduce((a, b) => a + b)
                      .toStringAsFixed(1),
                  Icons.school,
                  Colors.green,
                ),
                const Divider(),
                _buildStatRow(
                  'Aktivitas PKL',
                  stats.pklActivities.values.reduce((a, b) => a + b).toString(),
                  Icons.work,
                  Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatRow(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 16),
          Text(title),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
