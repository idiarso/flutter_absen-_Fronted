import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_model.freezed.dart';
part 'dashboard_model.g.dart';

@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required int totalPresence,
    required int totalLearningActivities,
    required int totalPKLDays,
    required double presencePercentage,
    required double learningProgress,
    required double pklProgress,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryFromJson(json);
}

@freezed
class RecentActivity with _$RecentActivity {
  const factory RecentActivity({
    required String id,
    required String type,
    required String title,
    required String description,
    required DateTime timestamp,
    String? status,
  }) = _RecentActivity;

  factory RecentActivity.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityFromJson(json);
}

@freezed
class DashboardStatistics with _$DashboardStatistics {
  const factory DashboardStatistics({
    required Map<String, int> presenceByDay,
    required Map<String, double> learningScores,
    required Map<String, int> pklActivities,
  }) = _DashboardStatistics;

  factory DashboardStatistics.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatisticsFromJson(json);
}
