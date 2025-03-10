import 'package:freezed_annotation/freezed_annotation.dart';

part 'piket_model.freezed.dart';
part 'piket_model.g.dart';

DateTime _dateFromJson(String date) {
  try {
    return DateTime.parse(date);
  } catch (e) {
    throw FormatException('Invalid date format: $date');
  }
}

String _dateToJson(DateTime date) => date.toIso8601String();

@freezed
class PiketSchedule with _$PiketSchedule {
  const PiketSchedule._();

  factory PiketSchedule({
    required int id,
    required int userId,
    required String day,
    required String shift,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime updatedAt,
  }) = _PiketSchedule;

  factory PiketSchedule.fromJson(Map<String, dynamic> json) =>
      _$PiketScheduleFromJson(json);
}

@freezed
class PiketActivity with _$PiketActivity {
  const PiketActivity._();

  factory PiketActivity({
    required int id,
    required int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime date,
    required String activity,
    required String status,
    String? documentation,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime updatedAt,
  }) = _PiketActivity;

  factory PiketActivity.fromJson(Map<String, dynamic> json) =>
      _$PiketActivityFromJson(json);
}

@freezed
class PiketReport with _$PiketReport {
  const PiketReport._();

  factory PiketReport({
    required int id,
    required int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime startDate,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime endDate,
    required int totalActivities,
    required int completedActivities,
    required double completionRate,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required DateTime updatedAt,
  }) = _PiketReport;

  factory PiketReport.fromJson(Map<String, dynamic> json) =>
      _$PiketReportFromJson(json);
}
