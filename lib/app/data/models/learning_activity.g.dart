// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningActivityImpl _$$LearningActivityImplFromJson(
  Map<String, dynamic> json,
) => _$LearningActivityImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  type: json['type'] as String,
  completed: json['completed'] as bool,
  completedAt:
      json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$$LearningActivityImplToJson(
  _$LearningActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'type': instance.type,
  'completed': instance.completed,
  'completedAt': instance.completedAt?.toIso8601String(),
};
