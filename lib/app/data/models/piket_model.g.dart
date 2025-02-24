// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PiketScheduleImpl _$$PiketScheduleImplFromJson(Map<String, dynamic> json) =>
    _$PiketScheduleImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      day: json['day'] as String,
      shift: json['shift'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketScheduleImplToJson(_$PiketScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'day': instance.day,
      'shift': instance.shift,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PiketActivityImpl _$$PiketActivityImplFromJson(Map<String, dynamic> json) =>
    _$PiketActivityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      activity: json['activity'] as String,
      status: json['status'] as String,
      documentation: json['documentation'] as String?,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketActivityImplToJson(_$PiketActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'activity': instance.activity,
      'status': instance.status,
      'documentation': instance.documentation,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$PiketReportImpl _$$PiketReportImplFromJson(Map<String, dynamic> json) =>
    _$PiketReportImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalActivities: (json['totalActivities'] as num).toInt(),
      completedActivities: (json['completedActivities'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketReportImplToJson(_$PiketReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalActivities': instance.totalActivities,
      'completedActivities': instance.completedActivities,
      'completionRate': instance.completionRate,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
