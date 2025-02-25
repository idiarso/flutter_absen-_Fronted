// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PiketSchedule _$PiketScheduleFromJson(Map<String, dynamic> json) {
  return _PiketSchedule.fromJson(json);
}

/// @nodoc
mixin _$PiketSchedule {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get day => throw _privateConstructorUsedError;
  String get shift => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PiketSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PiketSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PiketScheduleCopyWith<PiketSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiketScheduleCopyWith<$Res> {
  factory $PiketScheduleCopyWith(
    PiketSchedule value,
    $Res Function(PiketSchedule) then,
  ) = _$PiketScheduleCopyWithImpl<$Res, PiketSchedule>;
  @useResult
  $Res call({
    int id,
    int userId,
    String day,
    String shift,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class _$PiketScheduleCopyWithImpl<$Res, $Val extends PiketSchedule>
    implements $PiketScheduleCopyWith<$Res> {
  _$PiketScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PiketSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? day = null,
    Object? shift = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
            day:
                null == day
                    ? _value.day
                    : day // ignore: cast_nullable_to_non_nullable
                        as String,
            shift:
                null == shift
                    ? _value.shift
                    : shift // ignore: cast_nullable_to_non_nullable
                        as String,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PiketScheduleImplCopyWith<$Res>
    implements $PiketScheduleCopyWith<$Res> {
  factory _$$PiketScheduleImplCopyWith(
    _$PiketScheduleImpl value,
    $Res Function(_$PiketScheduleImpl) then,
  ) = __$$PiketScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    String day,
    String shift,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class __$$PiketScheduleImplCopyWithImpl<$Res>
    extends _$PiketScheduleCopyWithImpl<$Res, _$PiketScheduleImpl>
    implements _$$PiketScheduleImplCopyWith<$Res> {
  __$$PiketScheduleImplCopyWithImpl(
    _$PiketScheduleImpl _value,
    $Res Function(_$PiketScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PiketSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? day = null,
    Object? shift = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PiketScheduleImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
        day:
            null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                    as String,
        shift:
            null == shift
                ? _value.shift
                : shift // ignore: cast_nullable_to_non_nullable
                    as String,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PiketScheduleImpl implements _PiketSchedule {
  _$PiketScheduleImpl({
    required this.id,
    required this.userId,
    required this.day,
    required this.shift,
    this.notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.updatedAt,
  });

  factory _$PiketScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$PiketScheduleImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String day;
  @override
  final String shift;
  @override
  final String? notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PiketSchedule(id: $id, userId: $userId, day: $day, shift: $shift, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiketScheduleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    day,
    shift,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PiketSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PiketScheduleImplCopyWith<_$PiketScheduleImpl> get copyWith =>
      __$$PiketScheduleImplCopyWithImpl<_$PiketScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PiketScheduleImplToJson(this);
  }
}

abstract class _PiketSchedule implements PiketSchedule {
  factory _PiketSchedule({
    required final int id,
    required final int userId,
    required final String day,
    required final String shift,
    final String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime updatedAt,
  }) = _$PiketScheduleImpl;

  factory _PiketSchedule.fromJson(Map<String, dynamic> json) =
      _$PiketScheduleImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get day;
  @override
  String get shift;
  @override
  String? get notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt;

  /// Create a copy of PiketSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PiketScheduleImplCopyWith<_$PiketScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PiketActivity _$PiketActivityFromJson(Map<String, dynamic> json) {
  return _PiketActivity.fromJson(json);
}

/// @nodoc
mixin _$PiketActivity {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get date => throw _privateConstructorUsedError;
  String get activity => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get documentation => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PiketActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PiketActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PiketActivityCopyWith<PiketActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiketActivityCopyWith<$Res> {
  factory $PiketActivityCopyWith(
    PiketActivity value,
    $Res Function(PiketActivity) then,
  ) = _$PiketActivityCopyWithImpl<$Res, PiketActivity>;
  @useResult
  $Res call({
    int id,
    int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime date,
    String activity,
    String status,
    String? documentation,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class _$PiketActivityCopyWithImpl<$Res, $Val extends PiketActivity>
    implements $PiketActivityCopyWith<$Res> {
  _$PiketActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PiketActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? activity = null,
    Object? status = null,
    Object? documentation = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            activity:
                null == activity
                    ? _value.activity
                    : activity // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
            documentation:
                freezed == documentation
                    ? _value.documentation
                    : documentation // ignore: cast_nullable_to_non_nullable
                        as String?,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PiketActivityImplCopyWith<$Res>
    implements $PiketActivityCopyWith<$Res> {
  factory _$$PiketActivityImplCopyWith(
    _$PiketActivityImpl value,
    $Res Function(_$PiketActivityImpl) then,
  ) = __$$PiketActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime date,
    String activity,
    String status,
    String? documentation,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class __$$PiketActivityImplCopyWithImpl<$Res>
    extends _$PiketActivityCopyWithImpl<$Res, _$PiketActivityImpl>
    implements _$$PiketActivityImplCopyWith<$Res> {
  __$$PiketActivityImplCopyWithImpl(
    _$PiketActivityImpl _value,
    $Res Function(_$PiketActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PiketActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? activity = null,
    Object? status = null,
    Object? documentation = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PiketActivityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        activity:
            null == activity
                ? _value.activity
                : activity // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
        documentation:
            freezed == documentation
                ? _value.documentation
                : documentation // ignore: cast_nullable_to_non_nullable
                    as String?,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PiketActivityImpl implements _PiketActivity {
  _$PiketActivityImpl({
    required this.id,
    required this.userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) required this.date,
    required this.activity,
    required this.status,
    this.documentation,
    this.notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.updatedAt,
  });

  factory _$PiketActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PiketActivityImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime date;
  @override
  final String activity;
  @override
  final String status;
  @override
  final String? documentation;
  @override
  final String? notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PiketActivity(id: $id, userId: $userId, date: $date, activity: $activity, status: $status, documentation: $documentation, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiketActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.documentation, documentation) ||
                other.documentation == documentation) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    date,
    activity,
    status,
    documentation,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PiketActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PiketActivityImplCopyWith<_$PiketActivityImpl> get copyWith =>
      __$$PiketActivityImplCopyWithImpl<_$PiketActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PiketActivityImplToJson(this);
  }
}

abstract class _PiketActivity implements PiketActivity {
  factory _PiketActivity({
    required final int id,
    required final int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime date,
    required final String activity,
    required final String status,
    final String? documentation,
    final String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime updatedAt,
  }) = _$PiketActivityImpl;

  factory _PiketActivity.fromJson(Map<String, dynamic> json) =
      _$PiketActivityImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get date;
  @override
  String get activity;
  @override
  String get status;
  @override
  String? get documentation;
  @override
  String? get notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt;

  /// Create a copy of PiketActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PiketActivityImplCopyWith<_$PiketActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PiketReport _$PiketReportFromJson(Map<String, dynamic> json) {
  return _PiketReport.fromJson(json);
}

/// @nodoc
mixin _$PiketReport {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get endDate => throw _privateConstructorUsedError;
  int get totalActivities => throw _privateConstructorUsedError;
  int get completedActivities => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PiketReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PiketReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PiketReportCopyWith<PiketReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiketReportCopyWith<$Res> {
  factory $PiketReportCopyWith(
    PiketReport value,
    $Res Function(PiketReport) then,
  ) = _$PiketReportCopyWithImpl<$Res, PiketReport>;
  @useResult
  $Res call({
    int id,
    int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime startDate,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime endDate,
    int totalActivities,
    int completedActivities,
    double completionRate,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class _$PiketReportCopyWithImpl<$Res, $Val extends PiketReport>
    implements $PiketReportCopyWith<$Res> {
  _$PiketReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PiketReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? completionRate = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as int,
            startDate:
                null == startDate
                    ? _value.startDate
                    : startDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            endDate:
                null == endDate
                    ? _value.endDate
                    : endDate // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            totalActivities:
                null == totalActivities
                    ? _value.totalActivities
                    : totalActivities // ignore: cast_nullable_to_non_nullable
                        as int,
            completedActivities:
                null == completedActivities
                    ? _value.completedActivities
                    : completedActivities // ignore: cast_nullable_to_non_nullable
                        as int,
            completionRate:
                null == completionRate
                    ? _value.completionRate
                    : completionRate // ignore: cast_nullable_to_non_nullable
                        as double,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PiketReportImplCopyWith<$Res>
    implements $PiketReportCopyWith<$Res> {
  factory _$$PiketReportImplCopyWith(
    _$PiketReportImpl value,
    $Res Function(_$PiketReportImpl) then,
  ) = __$$PiketReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime startDate,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime endDate,
    int totalActivities,
    int completedActivities,
    double completionRate,
    String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson) DateTime updatedAt,
  });
}

/// @nodoc
class __$$PiketReportImplCopyWithImpl<$Res>
    extends _$PiketReportCopyWithImpl<$Res, _$PiketReportImpl>
    implements _$$PiketReportImplCopyWith<$Res> {
  __$$PiketReportImplCopyWithImpl(
    _$PiketReportImpl _value,
    $Res Function(_$PiketReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PiketReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? completionRate = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$PiketReportImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as int,
        startDate:
            null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        endDate:
            null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        totalActivities:
            null == totalActivities
                ? _value.totalActivities
                : totalActivities // ignore: cast_nullable_to_non_nullable
                    as int,
        completedActivities:
            null == completedActivities
                ? _value.completedActivities
                : completedActivities // ignore: cast_nullable_to_non_nullable
                    as int,
        completionRate:
            null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                    as double,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PiketReportImpl implements _PiketReport {
  _$PiketReportImpl({
    required this.id,
    required this.userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.startDate,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.endDate,
    required this.totalActivities,
    required this.completedActivities,
    required this.completionRate,
    this.notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required this.updatedAt,
  });

  factory _$PiketReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$PiketReportImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime startDate;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime endDate;
  @override
  final int totalActivities;
  @override
  final int completedActivities;
  @override
  final double completionRate;
  @override
  final String? notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PiketReport(id: $id, userId: $userId, startDate: $startDate, endDate: $endDate, totalActivities: $totalActivities, completedActivities: $completedActivities, completionRate: $completionRate, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiketReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalActivities, totalActivities) ||
                other.totalActivities == totalActivities) &&
            (identical(other.completedActivities, completedActivities) ||
                other.completedActivities == completedActivities) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    startDate,
    endDate,
    totalActivities,
    completedActivities,
    completionRate,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of PiketReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PiketReportImplCopyWith<_$PiketReportImpl> get copyWith =>
      __$$PiketReportImplCopyWithImpl<_$PiketReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PiketReportImplToJson(this);
  }
}

abstract class _PiketReport implements PiketReport {
  factory _PiketReport({
    required final int id,
    required final int userId,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime startDate,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime endDate,
    required final int totalActivities,
    required final int completedActivities,
    required final double completionRate,
    final String? notes,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime createdAt,
    @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
    required final DateTime updatedAt,
  }) = _$PiketReportImpl;

  factory _PiketReport.fromJson(Map<String, dynamic> json) =
      _$PiketReportImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get startDate;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get endDate;
  @override
  int get totalActivities;
  @override
  int get completedActivities;
  @override
  double get completionRate;
  @override
  String? get notes;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  DateTime get updatedAt;

  /// Create a copy of PiketReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PiketReportImplCopyWith<_$PiketReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
