// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jurnal_pkl_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JurnalPKL _$JurnalPKLFromJson(Map<String, dynamic> json) {
  return _JurnalPKL.fromJson(json);
}

/// @nodoc
mixin _$JurnalPKL {
  int? get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get tanggal => throw _privateConstructorUsedError;
  String get kegiatan => throw _privateConstructorUsedError;
  String? get dokumentasi => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // draft, submitted, approved, rejected
  String? get catatan => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get lokasi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JurnalPKLCopyWith<JurnalPKL> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JurnalPKLCopyWith<$Res> {
  factory $JurnalPKLCopyWith(JurnalPKL value, $Res Function(JurnalPKL) then) =
      _$JurnalPKLCopyWithImpl<$Res, JurnalPKL>;
  @useResult
  $Res call(
      {int? id,
      int userId,
      String tanggal,
      String kegiatan,
      String? dokumentasi,
      String status,
      String? catatan,
      DateTime createdAt,
      DateTime updatedAt,
      String? lokasi});
}

/// @nodoc
class _$JurnalPKLCopyWithImpl<$Res, $Val extends JurnalPKL>
    implements $JurnalPKLCopyWith<$Res> {
  _$JurnalPKLCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? tanggal = null,
    Object? kegiatan = null,
    Object? dokumentasi = freezed,
    Object? status = null,
    Object? catatan = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lokasi = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      kegiatan: null == kegiatan
          ? _value.kegiatan
          : kegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      dokumentasi: freezed == dokumentasi
          ? _value.dokumentasi
          : dokumentasi // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      catatan: freezed == catatan
          ? _value.catatan
          : catatan // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JurnalPKLImplCopyWith<$Res>
    implements $JurnalPKLCopyWith<$Res> {
  factory _$$JurnalPKLImplCopyWith(
          _$JurnalPKLImpl value, $Res Function(_$JurnalPKLImpl) then) =
      __$$JurnalPKLImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int userId,
      String tanggal,
      String kegiatan,
      String? dokumentasi,
      String status,
      String? catatan,
      DateTime createdAt,
      DateTime updatedAt,
      String? lokasi});
}

/// @nodoc
class __$$JurnalPKLImplCopyWithImpl<$Res>
    extends _$JurnalPKLCopyWithImpl<$Res, _$JurnalPKLImpl>
    implements _$$JurnalPKLImplCopyWith<$Res> {
  __$$JurnalPKLImplCopyWithImpl(
      _$JurnalPKLImpl _value, $Res Function(_$JurnalPKLImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? tanggal = null,
    Object? kegiatan = null,
    Object? dokumentasi = freezed,
    Object? status = null,
    Object? catatan = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? lokasi = freezed,
  }) {
    return _then(_$JurnalPKLImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as String,
      kegiatan: null == kegiatan
          ? _value.kegiatan
          : kegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      dokumentasi: freezed == dokumentasi
          ? _value.dokumentasi
          : dokumentasi // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      catatan: freezed == catatan
          ? _value.catatan
          : catatan // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lokasi: freezed == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JurnalPKLImpl implements _JurnalPKL {
  const _$JurnalPKLImpl(
      {this.id,
      required this.userId,
      required this.tanggal,
      required this.kegiatan,
      this.dokumentasi,
      required this.status,
      this.catatan,
      required this.createdAt,
      required this.updatedAt,
      this.lokasi});

  factory _$JurnalPKLImpl.fromJson(Map<String, dynamic> json) =>
      _$$JurnalPKLImplFromJson(json);

  @override
  final int? id;
  @override
  final int userId;
  @override
  final String tanggal;
  @override
  final String kegiatan;
  @override
  final String? dokumentasi;
  @override
  final String status;
// draft, submitted, approved, rejected
  @override
  final String? catatan;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? lokasi;

  @override
  String toString() {
    return 'JurnalPKL(id: $id, userId: $userId, tanggal: $tanggal, kegiatan: $kegiatan, dokumentasi: $dokumentasi, status: $status, catatan: $catatan, createdAt: $createdAt, updatedAt: $updatedAt, lokasi: $lokasi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JurnalPKLImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.kegiatan, kegiatan) ||
                other.kegiatan == kegiatan) &&
            (identical(other.dokumentasi, dokumentasi) ||
                other.dokumentasi == dokumentasi) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.catatan, catatan) || other.catatan == catatan) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, tanggal, kegiatan,
      dokumentasi, status, catatan, createdAt, updatedAt, lokasi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JurnalPKLImplCopyWith<_$JurnalPKLImpl> get copyWith =>
      __$$JurnalPKLImplCopyWithImpl<_$JurnalPKLImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JurnalPKLImplToJson(
      this,
    );
  }
}

abstract class _JurnalPKL implements JurnalPKL {
  const factory _JurnalPKL(
      {final int? id,
      required final int userId,
      required final String tanggal,
      required final String kegiatan,
      final String? dokumentasi,
      required final String status,
      final String? catatan,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? lokasi}) = _$JurnalPKLImpl;

  factory _JurnalPKL.fromJson(Map<String, dynamic> json) =
      _$JurnalPKLImpl.fromJson;

  @override
  int? get id;
  @override
  int get userId;
  @override
  String get tanggal;
  @override
  String get kegiatan;
  @override
  String? get dokumentasi;
  @override
  String get status;
  @override // draft, submitted, approved, rejected
  String? get catatan;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get lokasi;
  @override
  @JsonKey(ignore: true)
  _$$JurnalPKLImplCopyWith<_$JurnalPKLImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
