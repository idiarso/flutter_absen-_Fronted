// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardSummaryImpl _$$DashboardSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardSummaryImpl(
  totalPresence: (json['totalPresence'] as num).toInt(),
  totalLearningActivities: (json['totalLearningActivities'] as num).toInt(),
  totalPKLDays: (json['totalPKLDays'] as num).toInt(),
  presencePercentage: (json['presencePercentage'] as num).toDouble(),
  learningProgress: (json['learningProgress'] as num).toDouble(),
  pklProgress: (json['pklProgress'] as num).toDouble(),
);

Map<String, dynamic> _$$DashboardSummaryImplToJson(
  _$DashboardSummaryImpl instance,
) => <String, dynamic>{
  'totalPresence': instance.totalPresence,
  'totalLearningActivities': instance.totalLearningActivities,
  'totalPKLDays': instance.totalPKLDays,
  'presencePercentage': instance.presencePercentage,
  'learningProgress': instance.learningProgress,
  'pklProgress': instance.pklProgress,
};

_$RecentActivityImpl _$$RecentActivityImplFromJson(Map<String, dynamic> json) =>
    _$RecentActivityImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$RecentActivityImplToJson(
  _$RecentActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'title': instance.title,
  'description': instance.description,
  'timestamp': instance.timestamp.toIso8601String(),
  'status': instance.status,
};

_$DashboardStatisticsImpl _$$DashboardStatisticsImplFromJson(
  Map<String, dynamic> json,
) => _$DashboardStatisticsImpl(
  presenceByDay: Map<String, int>.from(json['presenceByDay'] as Map),
  learningScores: (json['learningScores'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  pklActivities: Map<String, int>.from(json['pklActivities'] as Map),
);

Map<String, dynamic> _$$DashboardStatisticsImplToJson(
  _$DashboardStatisticsImpl instance,
) => <String, dynamic>{
  'presenceByDay': instance.presenceByDay,
  'learningScores': instance.learningScores,
  'pklActivities': instance.pklActivities,
};
