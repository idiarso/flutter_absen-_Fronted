// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pkl_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PKLStudent _$PKLStudentFromJson(Map<String, dynamic> json) => PKLStudent(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  nis: json['nis'] as String?,
  kelas: json['kelas'] as String?,
  jurusan: json['jurusan'] as String?,
  tempatPKL: json['tempatPKL'] as String?,
  startDate:
      json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
  endDate:
      json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
  status: json['status'] as String?,
);

Map<String, dynamic> _$PKLStudentToJson(PKLStudent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nis': instance.nis,
      'kelas': instance.kelas,
      'jurusan': instance.jurusan,
      'tempatPKL': instance.tempatPKL,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': instance.status,
    };
