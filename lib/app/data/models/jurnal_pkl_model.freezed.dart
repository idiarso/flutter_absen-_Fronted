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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JurnalPKL _$JurnalPKLFromJson(Map<String, dynamic> json) {
  return _JurnalPKL.fromJson(json);
}

/// @nodoc
mixin _$JurnalPKL {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get tanggal => throw _privateConstructorUsedError;
  String get kegiatan => throw _privateConstructorUsedError;
  List<int> get dokumentasi => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // draft, submitted, approved, rejected
  String? get catatan => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get lokasi => throw _privateConstructorUsedError;
  String? get filename => throw _privateConstructorUsedError;

  /// Serializes this JurnalPKL to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JurnalPKL
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JurnalPKLCopyWith<JurnalPKL> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JurnalPKLCopyWith<$Res> {
  factory $JurnalPKLCopyWith(JurnalPKL value, $Res Function(JurnalPKL) then) =
      _$JurnalPKLCopyWithImpl<$Res, JurnalPKL>;
  @useResult
  $Res call({
    int? id,
    int? userId,
    String? tanggal,
    String kegiatan,
    List<int> dokumentasi,
    String status,
    String? catatan,
    DateTime? createdAt,
    DateTime? updatedAt,
    String lokasi,
    String? filename,
  });
}

/// @nodoc
class _$JurnalPKLCopyWithImpl<$Res, $Val extends JurnalPKL>
    implements $JurnalPKLCopyWith<$Res> {
  _$JurnalPKLCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JurnalPKL
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? tanggal = freezed,
    Object? kegiatan = null,
    Object? dokumentasi = null,
    Object? status = null,
    Object? catatan = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lokasi = null,
    Object? filename = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                freezed == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int?,
            userId:
                freezed == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int?,
            tanggal:
                freezed == tanggal
                    ? _value.tanggal
                    : tanggal // ignore: cast_nullable_to_non_nullable
                        as String?,
            kegiatan:
                null == kegiatan
                    ? _value.kegiatan
                    : kegiatan // ignore: cast_nullable_to_non_nullable
                        as String,
            dokumentasi:
                null == dokumentasi
                    ? _value.dokumentasi
                    : dokumentasi // ignore: cast_nullable_to_non_nullable
                        as List<int>,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            catatan:
                freezed == catatan
                    ? _value.catatan
                    : catatan // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            updatedAt:
                freezed == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            lokasi:
                null == lokasi
                    ? _value.lokasi
                    : lokasi // ignore: cast_nullable_to_non_nullable
                        as String,
            filename:
                freezed == filename
                    ? _value.filename
                    : filename // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JurnalPKLImplCopyWith<$Res>
    implements $JurnalPKLCopyWith<$Res> {
  factory _$$JurnalPKLImplCopyWith(
    _$JurnalPKLImpl value,
    $Res Function(_$JurnalPKLImpl) then,
  ) = __$$JurnalPKLImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int? userId,
    String? tanggal,
    String kegiatan,
    List<int> dokumentasi,
    String status,
    String? catatan,
    DateTime? createdAt,
    DateTime? updatedAt,
    String lokasi,
    String? filename,
  });
}

/// @nodoc
class __$$JurnalPKLImplCopyWithImpl<$Res>
    extends _$JurnalPKLCopyWithImpl<$Res, _$JurnalPKLImpl>
    implements _$$JurnalPKLImplCopyWith<$Res> {
  __$$JurnalPKLImplCopyWithImpl(
    _$JurnalPKLImpl _value,
    $Res Function(_$JurnalPKLImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JurnalPKL
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? tanggal = freezed,
    Object? kegiatan = null,
    Object? dokumentasi = null,
    Object? status = null,
    Object? catatan = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lokasi = null,
    Object? filename = freezed,
  }) {
    return _then(
      _$JurnalPKLImpl(
        id:
            freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int?,
        userId:
            freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int?,
        tanggal:
            freezed == tanggal
                ? _value.tanggal
                : tanggal // ignore: cast_nullable_to_non_nullable
                    as String?,
        kegiatan:
            null == kegiatan
                ? _value.kegiatan
                : kegiatan // ignore: cast_nullable_to_non_nullable
                    as String,
        dokumentasi:
            null == dokumentasi
                ? _value._dokumentasi
                : dokumentasi // ignore: cast_nullable_to_non_nullable
                    as List<int>,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        catatan:
            freezed == catatan
                ? _value.catatan
                : catatan // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        updatedAt:
            freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        lokasi:
            null == lokasi
                ? _value.lokasi
                : lokasi // ignore: cast_nullable_to_non_nullable
                    as String,
        filename:
            freezed == filename
                ? _value.filename
                : filename // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JurnalPKLImpl implements _JurnalPKL {
  const _$JurnalPKLImpl({
    this.id,
    this.userId,
    this.tanggal,
    required this.kegiatan,
    final List<int> dokumentasi = const [],
    this.status = 'draft',
    this.catatan,
    this.createdAt,
    this.updatedAt,
    required this.lokasi,
    this.filename,
  }) : _dokumentasi = dokumentasi;

  factory _$JurnalPKLImpl.fromJson(Map<String, dynamic> json) =>
      _$$JurnalPKLImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final String? tanggal;
  @override
  final String kegiatan;
  final List<int> _dokumentasi;
  @override
  @JsonKey()
  List<int> get dokumentasi {
    if (_dokumentasi is EqualUnmodifiableListView) return _dokumentasi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dokumentasi);
  }

  @override
  @JsonKey()
  final String status;
  // draft, submitted, approved, rejected
  @override
  final String? catatan;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String lokasi;
  @override
  final String? filename;

  @override
  String toString() {
    return 'JurnalPKL(id: $id, userId: $userId, tanggal: $tanggal, kegiatan: $kegiatan, dokumentasi: $dokumentasi, status: $status, catatan: $catatan, createdAt: $createdAt, updatedAt: $updatedAt, lokasi: $lokasi, filename: $filename)';
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
            const DeepCollectionEquality().equals(
              other._dokumentasi,
              _dokumentasi,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.catatan, catatan) || other.catatan == catatan) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.filename, filename) ||
                other.filename == filename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    tanggal,
    kegiatan,
    const DeepCollectionEquality().hash(_dokumentasi),
    status,
    catatan,
    createdAt,
    updatedAt,
    lokasi,
    filename,
  );

  /// Create a copy of JurnalPKL
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JurnalPKLImplCopyWith<_$JurnalPKLImpl> get copyWith =>
      __$$JurnalPKLImplCopyWithImpl<_$JurnalPKLImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JurnalPKLImplToJson(this);
  }
}

abstract class _JurnalPKL implements JurnalPKL {
  const factory _JurnalPKL({
    final int? id,
    final int? userId,
    final String? tanggal,
    required final String kegiatan,
    final List<int> dokumentasi,
    final String status,
    final String? catatan,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    required final String lokasi,
    final String? filename,
  }) = _$JurnalPKLImpl;

  factory _JurnalPKL.fromJson(Map<String, dynamic> json) =
      _$JurnalPKLImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  String? get tanggal;
  @override
  String get kegiatan;
  @override
  List<int> get dokumentasi;
  @override
  String get status; // draft, submitted, approved, rejected
  @override
  String? get catatan;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String get lokasi;
  @override
  String? get filename;

  /// Create a copy of JurnalPKL
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JurnalPKLImplCopyWith<_$JurnalPKLImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
