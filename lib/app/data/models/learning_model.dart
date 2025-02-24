import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_model.freezed.dart';
part 'learning_model.g.dart';

@freezed
class LearningActivity with _$LearningActivity {
  const factory LearningActivity({
    required String id,
    required String title,
    required String description,
    required String type,
    required String status,
    required DateTime dueDate,
    String? attachmentUrl,
    double? score,
    String? feedback,
  }) = _LearningActivity;

  factory LearningActivity.fromJson(Map<String, dynamic> json) =>
      _$LearningActivityFromJson(json);
}

@freezed
class LearningProgress with _$LearningProgress {
  const factory LearningProgress({
    required int totalActivities,
    required int completedActivities,
    required double averageScore,
    required List<String> completedTypes,
    required Map<String, int> activityTypeCount,
  }) = _LearningProgress;

  factory LearningProgress.fromJson(Map<String, dynamic> json) =>
      _$LearningProgressFromJson(json);
}
