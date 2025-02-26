import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_activity.g.dart';
part 'learning_activity.freezed.dart';

@freezed
class LearningActivity with _$LearningActivity {
  const factory LearningActivity({
    required String id,
    required String title,
    required String description,
    required String type,
    required bool completed,
    DateTime? completedAt,
  }) = _LearningActivity;

  factory LearningActivity.fromJson(Map<String, dynamic> json) =>
      _$LearningActivityFromJson(json);
}