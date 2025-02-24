import 'package:freezed_annotation/freezed_annotation.dart';

part 'jurnal_pkl_model.freezed.dart';
part 'jurnal_pkl_model.g.dart';

@freezed
class JurnalPKL with _$JurnalPKL {
  const factory JurnalPKL({
    int? id,
    int? userId,
    String? tanggal,
    required String kegiatan,
    @Default([]) List<int> dokumentasi,
    @Default('draft') String status, // draft, submitted, approved, rejected
    String? catatan,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String lokasi,
    String? filename,
  }) = _JurnalPKL;

  factory JurnalPKL.fromJson(Map<String, dynamic> json) => _$JurnalPKLFromJson(json);
}
