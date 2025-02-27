import 'package:json_annotation/json_annotation.dart';

part 'pkl_student_model.g.dart';

@JsonSerializable()
class PKLStudent {
  final int? id;
  final String? name;
  final String? nis;
  final String? kelas;
  final String? jurusan;
  final String? tempatPKL;
  final String? pembimbing;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? status;
  final String? lokasi;

  PKLStudent({
    this.id,
    this.name,
    this.nis,
    this.kelas,
    this.jurusan,
    this.tempatPKL,
    this.pembimbing,
    this.startDate,
    this.endDate,
    this.status,
    this.lokasi,
  });

  factory PKLStudent.fromJson(Map<String, dynamic> json) =>
      _$PKLStudentFromJson(json);
  Map<String, dynamic> toJson() => _$PKLStudentToJson(this);
}
