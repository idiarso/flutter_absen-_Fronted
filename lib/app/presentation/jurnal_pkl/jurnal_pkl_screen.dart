import 'package:flutter/material.dart';
import 'package:skansapung_presensi/app/presentation/jurnal_pkl/jurnal_pkl_notifier.dart';
import 'package:skansapung_presensi/core/widget/app_widget.dart';

class JurnalPKLScreen extends AppWidget<JurnalPKLNotifier, void, void> {
  JurnalPKLScreen({super.key});

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, ${notifier.userName}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari menu...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Menu Grid
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu Utama',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildGridItem(
                        icon: Icons.edit_note,
                        label: 'Input\nKegiatan',
                        onTap: () => notifier.navigateToInputKegiatan(),
                        color: Colors.blue,
                      ),
                      _buildGridItem(
                        icon: Icons.history,
                        label: 'Riwayat\nKegiatan',
                        onTap: () => notifier.navigateToRiwayatKegiatan(),
                        color: Colors.green,
                      ),
                      _buildGridItem(
                        icon: Icons.assessment,
                        label: 'Laporan\nPKL',
                        onTap: () => notifier.navigateToLaporanPKL(),
                        color: Colors.orange,
                      ),
                      _buildGridItem(
                        icon: Icons.picture_as_pdf,
                        label: 'Export\nPDF',
                        onTap: () => notifier.exportToPDF(),
                        color: Colors.red,
                      ),
                      _buildGridItem(
                        icon: Icons.work,
                        label: 'Info\nPKL',
                        onTap: () => notifier.navigateToInfoPKL(),
                        color: Colors.purple,
                      ),
                      _buildGridItem(
                        icon: Icons.person_outline,
                        label: 'Pembimbing',
                        onTap: () => notifier.navigateToPembimbing(),
                        color: Colors.teal,
                      ),
                      _buildGridItem(
                        icon: Icons.calendar_today,
                        label: 'Jadwal',
                        onTap: () => notifier.navigateToJadwal(),
                        color: Colors.indigo,
                      ),
                      _buildGridItem(
                        icon: Icons.more_horiz,
                        label: 'Lainnya',
                        onTap: () => notifier.navigateToLainnya(),
                        color: Colors.brown,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Pemberitahuan Section
                  const Text(
                    'Pemberitahuan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          'https://img.freepik.com/free-vector/teaching-concept-illustration_114360-1708.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ayo isi Jurnal PKL!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Jangan lupa untuk mengisi jurnal kegiatan PKL hari ini',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
