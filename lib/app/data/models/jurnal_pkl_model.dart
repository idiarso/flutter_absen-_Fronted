import 'package:freezed_annotation/freezed_annotation.dart';

part 'jurnal_pkl_model.freezed.dart';
part 'jurnal_pkl_model.g.dart';

@freezed
class JurnalPKL with _$JurnalPKL {
  const factory JurnalPKL({
    int? id,
    required int userId,
    required String tanggal,
    required String kegiatan,
    String? dokumentasi,
    required String status, // draft, submitted, approved, rejected
    String? catatan,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? lokasi,
  }) = _JurnalPKL;

  factory JurnalPKL.fromJson(Map<String, dynamic> json) => _$JurnalPKLFromJson(json);
}
