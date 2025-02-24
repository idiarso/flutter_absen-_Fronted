// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningActivityImpl _$$LearningActivityImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningActivityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      attachmentUrl: json['attachmentUrl'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$$LearningActivityImplToJson(
        _$LearningActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'status': instance.status,
      'dueDate': instance.dueDate.toIso8601String(),
      'attachmentUrl': instance.attachmentUrl,
      'score': instance.score,
      'feedback': instance.feedback,
    };

_$LearningProgressImpl _$$LearningProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$LearningProgressImpl(
      totalActivities: (json['totalActivities'] as num).toInt(),
      completedActivities: (json['completedActivities'] as num).toInt(),
      averageScore: (json['averageScore'] as num).toDouble(),
      completedTypes: (json['completedTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      activityTypeCount:
          Map<String, int>.from(json['activityTypeCount'] as Map),
    );

Map<String, dynamic> _$$LearningProgressImplToJson(
        _$LearningProgressImpl instance) =>
    <String, dynamic>{
      'totalActivities': instance.totalActivities,
      'completedActivities': instance.completedActivities,
      'averageScore': instance.averageScore,
      'completedTypes': instance.completedTypes,
      'activityTypeCount': instance.activityTypeCount,
    };
