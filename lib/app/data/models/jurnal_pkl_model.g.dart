// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jurnal_pkl_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JurnalPKLImpl _$$JurnalPKLImplFromJson(Map<String, dynamic> json) =>
    _$JurnalPKLImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      tanggal: json['tanggal'] as String,
      kegiatan: json['kegiatan'] as String,
      dokumentasi: json['dokumentasi'] as String?,
      status: json['status'] as String,
      catatan: json['catatan'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      lokasi: json['lokasi'] as String?,
    );

Map<String, dynamic> _$$JurnalPKLImplToJson(_$JurnalPKLImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tanggal': instance.tanggal,
      'kegiatan': instance.kegiatan,
      'dokumentasi': instance.dokumentasi,
      'status': instance.status,
      'catatan': instance.catatan,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'lokasi': instance.lokasi,
    };
