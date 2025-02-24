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
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime createdAt,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime updatedAt,
  }) = _PiketSchedule;

  factory PiketSchedule.fromJson(Map<String, dynamic> json) =>
      _$PiketScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$PiketScheduleToJson(this);
}

@freezed
class PiketActivity with _$PiketActivity {
  const factory PiketActivity({
    required int id,
    required int userId,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime date,
    required String activity,
    required String status, // ongoing, completed
    String? documentation,
    String? notes,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime createdAt,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime updatedAt,
  }) = _PiketActivity;

  factory PiketActivity.fromJson(Map<String, dynamic> json) =>
      _$PiketActivityFromJson(json);

  Map<String, dynamic> toJson() => _$PiketActivityToJson(this);
}

@freezed
class PiketReport with _$PiketReport {
  const factory PiketReport({
    required int id,
    required int userId,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime startDate,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime endDate,
    required int totalActivities,
    required int completedActivities,
    required double completionRate,
    String? notes,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime createdAt,
    @JsonKey(fromJson: DateTime.parse, toJson: DateTime.toIso8601String) required DateTime updatedAt,
  }) = _PiketReport;

  factory PiketReport.fromJson(Map<String, dynamic> json) =>
      _$PiketReportFromJson(json);

  Map<String, dynamic> toJson() => _$PiketReportToJson(this);
}
