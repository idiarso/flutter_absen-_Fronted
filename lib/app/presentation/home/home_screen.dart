import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/app/presentation/detail_attendance/detail_attendance_screen.dart';
import 'package:skansapung_presensi/app/presentation/face_recognition/face_recognition_screen.dart';
import 'package:skansapung_presensi/app/presentation/home/home_notifier.dart';
import 'package:skansapung_presensi/app/presentation/login/login_screen.dart';
import 'package:skansapung_presensi/app/presentation/map/map_screen.dart';
import 'package:skansapung_presensi/core/helper/date_time_helper.dart';
import 'package:skansapung_presensi/core/helper/dialog_helper.dart';
import 'package:skansapung_presensi/core/helper/global_helper.dart';
import 'package:skansapung_presensi/core/helper/shared_preferences_helper.dart';
import 'package:skansapung_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends AppWidget<HomeNotifier, void, void> {
  HomeScreen({super.key});

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => notifier.init(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerLayout(context),
              _menuGrid(context),
              _todayLayout(context),
              _thisMonthLayout(context),
            ],
          ),
        ),
      ),
    );
  }

  _headerLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                GlobalHelper.getColorSchema(context).primaryContainer,
            radius: 30,
            child: const Icon(Icons.person, size: 40),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notifier.name,
                  style: GlobalHelper.getTextStyle(
                    context,
                    appTextStyle: AppTextStyle.HEADLINE_SMALL,
                  )?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                (notifier.isLeaves)
                    ? const SizedBox()
                    : Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.location_city),
                              const SizedBox(width: 5),
                              Text(notifier.schedule?.office.name ?? ''),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.access_time),
                              const SizedBox(width: 5),
                              Text(notifier.schedule?.shift.name ?? ''),
                            ],
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => _onPressEditNotification(context),
            icon: const Icon(Icons.edit_notifications),
          ),
          IconButton(
            onPressed: () => _onPressLogout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  _menuGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Menu',
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
                icon: Icons.person_pin_circle,
                label: 'Presensi',
                color: Theme.of(context).primaryColor,
                onTap: () => notifier.navigateToFaceRecognition(),
              ),
              _buildGridItem(
                icon: Icons.edit_note,
                label: 'Jurnal\nPKL',
                color: Colors.blue,
                onTap: () => Navigator.pushNamed(context, '/jurnal-pkl'),
              ),
              _buildGridItem(
                icon: Icons.map,
                label: 'Lokasi',
                color: Colors.green,
                onTap: () => notifier.navigateToMap(),
              ),
              _buildGridItem(
                icon: Icons.history,
                label: 'Riwayat',
                color: Colors.orange,
                onTap: () => notifier.navigateToDetailAttendance(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
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

  _todayLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status Kehadiran Hari Ini',
            style: GlobalHelper.getTextStyle(
              context,
              appTextStyle: AppTextStyle.TITLE_MEDIUM,
            )?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Masuk',
                      style: GlobalHelper.getTextStyle(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notifier.attendanceToday?.checkIn != null
                          ? DateTimeHelper.formatTime(
                            notifier.attendanceToday!.checkIn!,
                          )
                          : '- : -',
                      style: GlobalHelper.getTextStyle(
                        context,
                        appTextStyle: AppTextStyle.TITLE_MEDIUM,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pulang',
                      style: GlobalHelper.getTextStyle(
                        context,
                        appTextStyle: AppTextStyle.BODY_MEDIUM,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notifier.attendanceToday?.checkOut != null
                          ? DateTimeHelper.formatTime(
                            notifier.attendanceToday!.checkOut!,
                          )
                          : '- : -',
                      style: GlobalHelper.getTextStyle(
                        context,
                        appTextStyle: AppTextStyle.TITLE_MEDIUM,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed:
                () =>
                    notifier.attendanceToday == null
                        ? _onPressPresensi(context)
                        : _onPressDetailAttendance(context),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              notifier.attendanceToday == null
                  ? 'Presensi Sekarang'
                  : 'Lihat Detail',
              style: GlobalHelper.getTextStyle(
                context,
                appTextStyle: AppTextStyle.LABEL_LARGE,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _thisMonthLayout(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
      ),
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: GlobalHelper.getColorSchema(context).primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Presensi Sebulan Terakhir',
                  style: GlobalHelper.getTextStyle(
                    context,
                    appTextStyle: AppTextStyle.TITLE_LARGE,
                  ),
                ),
              ),
              FilledButton(
                onPressed: () => _onPressSeeAll(context),
                child: const Text('Lihat Semua'),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            height: 1,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Tgl',
                    style: GlobalHelper.getTextStyle(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Datang',
                    style: GlobalHelper.getTextStyle(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    'Pulang',
                    style: GlobalHelper.getTextStyle(
                      context,
                      appTextStyle: AppTextStyle.TITLE_SMALL,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Container(
            height: 2,
            color: GlobalHelper.getColorSchema(context).primary,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder:
                (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 1,
                  color: GlobalHelper.getColorSchema(context).surface,
                ),
            itemCount: notifier.listAttendanceThisMonth.length,
            itemBuilder: (context, index) {
              final item =
                  notifier.listAttendanceThisMonth[notifier
                          .listAttendanceThisMonth
                          .length -
                      index -
                      1];
              return _itemThisMonth(context, item);
            },
          ),
        ],
      ),
    );
  }

  _timeTodayLayout(BuildContext context, String label, String time) {
    return Expanded(
      child: Column(
        children: [
          Text(
            time,
            style: GlobalHelper.getTextStyle(
              context,
              appTextStyle: AppTextStyle.HEADLINE_MEDIUM,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(context).onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: GlobalHelper.getTextStyle(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(color: GlobalHelper.getColorSchema(context).onPrimary),
          ),
        ],
      ),
    );
  }

  _itemThisMonth(BuildContext context, AttendanceEntity item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: GlobalHelper.getColorSchema(context).primary,
              ),
              child: Text(
                DateTimeHelper.formatDateTimeFromString(
                  dateTimeString: item.date!,
                  format: 'dd\nMMM',
                ),
                style: GlobalHelper.getTextStyle(
                  context,
                  appTextStyle: AppTextStyle.LABEL_LARGE,
                )?.copyWith(
                  color: GlobalHelper.getColorSchema(context).onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                item.startTime,
                style: GlobalHelper.getTextStyle(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                item.endTime,
                style: GlobalHelper.getTextStyle(
                  context,
                  appTextStyle: AppTextStyle.BODY_MEDIUM,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPressPresensi(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FaceRecognitionScreen()),
    );
    notifier.init();
  }

  _onPressDetailAttendance(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailAttendanceScreen()),
    );
  }

  _onPressEditNotification(BuildContext context) async {
    DialogHelper.showBottomDialog(
      context: context,
      title: "Edit waktu notifikasi",
      content: DropdownMenu<int>(
        initialSelection: notifier.timeNotification,
        onSelected: (value) => _onSaveEditNotification(context, value!),
        dropdownMenuEntries: notifier.listEditNotification,
      ),
    );
  }

  _onPressLogout(BuildContext context) async {
    await SharedPreferencesHelper.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }

  _onPressSeeAll(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailAttendanceScreen()),
    );
  }

  _onSaveEditNotification(BuildContext context, int param) {
    Navigator.pop(context);
    notifier.saveNotificationSetting(param);
  }
}
