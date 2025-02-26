// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningProgressImpl _$$LearningProgressImplFromJson(
  Map<String, dynamic> json,
) => _$LearningProgressImpl(
  totalActivities: (json['totalActivities'] as num).toInt(),
  completedActivities: (json['completedActivities'] as num).toInt(),
  progressPercentage: (json['progressPercentage'] as num).toDouble(),
);

Map<String, dynamic> _$$LearningProgressImplToJson(
  _$LearningProgressImpl instance,
) => <String, dynamic>{
  'totalActivities': instance.totalActivities,
  'completedActivities': instance.completedActivities,
  'progressPercentage': instance.progressPercentage,
};
