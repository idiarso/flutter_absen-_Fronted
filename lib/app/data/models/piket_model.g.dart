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
      createdAt: _dateFromJson(json['createdAt'] as String),
      updatedAt: _dateFromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketScheduleImplToJson(_$PiketScheduleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'day': instance.day,
      'shift': instance.shift,
      'notes': instance.notes,
      'createdAt': _dateToJson(instance.createdAt),
      'updatedAt': _dateToJson(instance.updatedAt),
    };

_$PiketActivityImpl _$$PiketActivityImplFromJson(Map<String, dynamic> json) =>
    _$PiketActivityImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      date: _dateFromJson(json['date'] as String),
      activity: json['activity'] as String,
      status: json['status'] as String,
      documentation: json['documentation'] as String?,
      notes: json['notes'] as String?,
      createdAt: _dateFromJson(json['createdAt'] as String),
      updatedAt: _dateFromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketActivityImplToJson(_$PiketActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': _dateToJson(instance.date),
      'activity': instance.activity,
      'status': instance.status,
      'documentation': instance.documentation,
      'notes': instance.notes,
      'createdAt': _dateToJson(instance.createdAt),
      'updatedAt': _dateToJson(instance.updatedAt),
    };

_$PiketReportImpl _$$PiketReportImplFromJson(Map<String, dynamic> json) =>
    _$PiketReportImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      startDate: _dateFromJson(json['startDate'] as String),
      endDate: _dateFromJson(json['endDate'] as String),
      totalActivities: (json['totalActivities'] as num).toInt(),
      completedActivities: (json['completedActivities'] as num).toInt(),
      completionRate: (json['completionRate'] as num).toDouble(),
      notes: json['notes'] as String?,
      createdAt: _dateFromJson(json['createdAt'] as String),
      updatedAt: _dateFromJson(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PiketReportImplToJson(_$PiketReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'startDate': _dateToJson(instance.startDate),
      'endDate': _dateToJson(instance.endDate),
      'totalActivities': instance.totalActivities,
      'completedActivities': instance.completedActivities,
      'completionRate': instance.completionRate,
      'notes': instance.notes,
      'createdAt': _dateToJson(instance.createdAt),
      'updatedAt': _dateToJson(instance.updatedAt),
    };
