import 'package:skansapung_presensi/app/module/entity/attendance.dart';
import 'package:skansapung_presensi/app/presentation/detail_attendance/detail_attendance_notifier.dart';
import 'package:skansapung_presensi/core/helper/date_time_helper.dart';
import 'package:skansapung_presensi/core/helper/global_helper.dart';
import 'package:skansapung_presensi/core/widget/app_widget.dart';
import 'package:flutter/material.dart';

class DetailAttendanceScreen
    extends AppWidget<DetailAttendanceNotifier, void, void> {
  DetailAttendanceScreen({super.key});

  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(title: const Text('Detail Kehadiran'));
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<int>(
                    expandedInsets: const EdgeInsets.symmetric(horizontal: 1),
                    label: const Text('Bulan'),
                    dropdownMenuEntries: notifier.monthListDropdown,
                    controller: notifier.monthController,
                    initialSelection: 1,
                    enabled: !notifier.isLoading,
                    menuStyle: MenuStyle(
                      elevation: const MaterialStatePropertyAll(8),
                      shadowColor: const MaterialStatePropertyAll(
                        Colors.black54,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownMenu<int>(
                    expandedInsets: const EdgeInsets.symmetric(horizontal: 1),
                    label: const Text('Tahun'),
                    dropdownMenuEntries: notifier.yearListDropdown,
                    controller: notifier.yearController,
                    initialSelection: 2024,
                    enabled: !notifier.isLoading,
                    menuStyle: MenuStyle(
                      elevation: const MaterialStatePropertyAll(8),
                      shadowColor: const MaterialStatePropertyAll(
                        Colors.black54,
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    onPressed: notifier.isLoading ? null : _onPressSearch,
                    icon:
                        notifier.isLoading
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Icon(Icons.search),
                    tooltip: 'Cari data kehadiran',
                  ),
                ),
              ],
            ),
            if (notifier.errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  notifier.errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 14,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: GlobalHelper.getColorSchema(context).outline,
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
              color: GlobalHelper.getColorSchema(context).outline,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder:
                  (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 1,
                    color: GlobalHelper.getColorSchema(context).outlineVariant,
                  ),
              itemCount: notifier.listAttendance.length,
              itemBuilder: (context, index) {
                final item =
                    notifier.listAttendance[notifier.listAttendance.length -
                        index -
                        1];
                return Semantics(
                  label: 'Attendance record for ${item.date}',
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      GlobalHelper.getColorSchema(
                                        context,
                                      ).primary,
                                ),
                                child: Text(
                                  DateTimeHelper.formatDateTimeFromString(
                                    dateTimeString: item.date!,
                                    format: 'dd\nMMM',  // Fixed typo from 'formar' to 'format'
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Datang',
                                    style: GlobalHelper.getTextStyle(
                                      context,
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
                                    ),
                                  ),
                                  Text(
                                    item.startTime,
                                    style: GlobalHelper.getTextStyle(
                                      context,
                                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pulang',
                                    style: GlobalHelper.getTextStyle(
                                      context,
                                      appTextStyle: AppTextStyle.LABEL_SMALL,
                                    ),
                                  ),
                                  Text(
                                    item.endTime,
                                    style: GlobalHelper.getTextStyle(
                                      context,
                                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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

  _onPressSearch() {
    notifier.search();
  }
}
