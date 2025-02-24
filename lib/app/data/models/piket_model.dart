import 'package:freezed_annotation/freezed_annotation.dart';

part 'piket_model.freezed.dart';
part 'piket_model.g.dart';

@freezed
class PiketSchedule with _$PiketSchedule {
  const factory PiketSchedule({
    required int id,
    required int userId,
    required String day,
    required String shift,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PiketSchedule;

  factory PiketSchedule.fromJson(Map<String, dynamic> json) =>
      _$PiketScheduleFromJson(json);
}

@freezed
class PiketActivity with _$PiketActivity {
  const factory PiketActivity({
    required int id,
    required int userId,
    required DateTime date,
    required String activity,
    required String status, // ongoing, completed
    String? documentation,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PiketActivity;

  factory PiketActivity.fromJson(Map<String, dynamic> json) =>
      _$PiketActivityFromJson(json);
}

@freezed
class PiketReport with _$PiketReport {
  const factory PiketReport({
    required int id,
    required int userId,
    required DateTime startDate,
    required DateTime endDate,
    required int totalActivities,
    required int completedActivities,
    required double completionRate,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PiketReport;

  factory PiketReport.fromJson(Map<String, dynamic> json) =>
      _$PiketReportFromJson(json);
}
