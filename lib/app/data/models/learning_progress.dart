import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_progress.g.dart';
part 'learning_progress.freezed.dart';

@freezed
class LearningProgress with _$LearningProgress {
  const factory LearningProgress({
    required int totalActivities,
    required int completedActivities,
    required double progressPercentage,
  }) = _LearningProgress;

  factory LearningProgress.fromJson(Map<String, dynamic> json) =>
      _$LearningProgressFromJson(json);
}