// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningActivity _$LearningActivityFromJson(Map<String, dynamic> json) {
  return _LearningActivity.fromJson(json);
}

/// @nodoc
mixin _$LearningActivity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  String? get attachmentUrl => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;
  String? get feedback => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningActivityCopyWith<LearningActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningActivityCopyWith<$Res> {
  factory $LearningActivityCopyWith(
          LearningActivity value, $Res Function(LearningActivity) then) =
      _$LearningActivityCopyWithImpl<$Res, LearningActivity>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String status,
      DateTime dueDate,
      String? attachmentUrl,
      double? score,
      String? feedback});
}

/// @nodoc
class _$LearningActivityCopyWithImpl<$Res, $Val extends LearningActivity>
    implements $LearningActivityCopyWith<$Res> {
  _$LearningActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? dueDate = null,
    Object? attachmentUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningActivityImplCopyWith<$Res>
    implements $LearningActivityCopyWith<$Res> {
  factory _$$LearningActivityImplCopyWith(_$LearningActivityImpl value,
          $Res Function(_$LearningActivityImpl) then) =
      __$$LearningActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String type,
      String status,
      DateTime dueDate,
      String? attachmentUrl,
      double? score,
      String? feedback});
}

/// @nodoc
class __$$LearningActivityImplCopyWithImpl<$Res>
    extends _$LearningActivityCopyWithImpl<$Res, _$LearningActivityImpl>
    implements _$$LearningActivityImplCopyWith<$Res> {
  __$$LearningActivityImplCopyWithImpl(_$LearningActivityImpl _value,
      $Res Function(_$LearningActivityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? status = null,
    Object? dueDate = null,
    Object? attachmentUrl = freezed,
    Object? score = freezed,
    Object? feedback = freezed,
  }) {
    return _then(_$LearningActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningActivityImpl implements _LearningActivity {
  const _$LearningActivityImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.status,
      required this.dueDate,
      this.attachmentUrl,
      this.score,
      this.feedback});

  factory _$LearningActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  final String status;
  @override
  final DateTime dueDate;
  @override
  final String? attachmentUrl;
  @override
  final double? score;
  @override
  final String? feedback;

  @override
  String toString() {
    return 'LearningActivity(id: $id, title: $title, description: $description, type: $type, status: $status, dueDate: $dueDate, attachmentUrl: $attachmentUrl, score: $score, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      status, dueDate, attachmentUrl, score, feedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningActivityImplCopyWith<_$LearningActivityImpl> get copyWith =>
      __$$LearningActivityImplCopyWithImpl<_$LearningActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningActivityImplToJson(
      this,
    );
  }
}

abstract class _LearningActivity implements LearningActivity {
  const factory _LearningActivity(
      {required final String id,
      required final String title,
      required final String description,
      required final String type,
      required final String status,
      required final DateTime dueDate,
      final String? attachmentUrl,
      final double? score,
      final String? feedback}) = _$LearningActivityImpl;

  factory _LearningActivity.fromJson(Map<String, dynamic> json) =
      _$LearningActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  String get status;
  @override
  DateTime get dueDate;
  @override
  String? get attachmentUrl;
  @override
  double? get score;
  @override
  String? get feedback;
  @override
  @JsonKey(ignore: true)
  _$$LearningActivityImplCopyWith<_$LearningActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LearningProgress _$LearningProgressFromJson(Map<String, dynamic> json) {
  return _LearningProgress.fromJson(json);
}

/// @nodoc
mixin _$LearningProgress {
  int get totalActivities => throw _privateConstructorUsedError;
  int get completedActivities => throw _privateConstructorUsedError;
  double get averageScore => throw _privateConstructorUsedError;
  List<String> get completedTypes => throw _privateConstructorUsedError;
  Map<String, int> get activityTypeCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningProgressCopyWith<LearningProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningProgressCopyWith<$Res> {
  factory $LearningProgressCopyWith(
          LearningProgress value, $Res Function(LearningProgress) then) =
      _$LearningProgressCopyWithImpl<$Res, LearningProgress>;
  @useResult
  $Res call(
      {int totalActivities,
      int completedActivities,
      double averageScore,
      List<String> completedTypes,
      Map<String, int> activityTypeCount});
}

/// @nodoc
class _$LearningProgressCopyWithImpl<$Res, $Val extends LearningProgress>
    implements $LearningProgressCopyWith<$Res> {
  _$LearningProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? averageScore = null,
    Object? completedTypes = null,
    Object? activityTypeCount = null,
  }) {
    return _then(_value.copyWith(
      totalActivities: null == totalActivities
          ? _value.totalActivities
          : totalActivities // ignore: cast_nullable_to_non_nullable
              as int,
      completedActivities: null == completedActivities
          ? _value.completedActivities
          : completedActivities // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      completedTypes: null == completedTypes
          ? _value.completedTypes
          : completedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activityTypeCount: null == activityTypeCount
          ? _value.activityTypeCount
          : activityTypeCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningProgressImplCopyWith<$Res>
    implements $LearningProgressCopyWith<$Res> {
  factory _$$LearningProgressImplCopyWith(_$LearningProgressImpl value,
          $Res Function(_$LearningProgressImpl) then) =
      __$$LearningProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalActivities,
      int completedActivities,
      double averageScore,
      List<String> completedTypes,
      Map<String, int> activityTypeCount});
}

/// @nodoc
class __$$LearningProgressImplCopyWithImpl<$Res>
    extends _$LearningProgressCopyWithImpl<$Res, _$LearningProgressImpl>
    implements _$$LearningProgressImplCopyWith<$Res> {
  __$$LearningProgressImplCopyWithImpl(_$LearningProgressImpl _value,
      $Res Function(_$LearningProgressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? averageScore = null,
    Object? completedTypes = null,
    Object? activityTypeCount = null,
  }) {
    return _then(_$LearningProgressImpl(
      totalActivities: null == totalActivities
          ? _value.totalActivities
          : totalActivities // ignore: cast_nullable_to_non_nullable
              as int,
      completedActivities: null == completedActivities
          ? _value.completedActivities
          : completedActivities // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: null == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double,
      completedTypes: null == completedTypes
          ? _value._completedTypes
          : completedTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      activityTypeCount: null == activityTypeCount
          ? _value._activityTypeCount
          : activityTypeCount // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningProgressImpl implements _LearningProgress {
  const _$LearningProgressImpl(
      {required this.totalActivities,
      required this.completedActivities,
      required this.averageScore,
      required final List<String> completedTypes,
      required final Map<String, int> activityTypeCount})
      : _completedTypes = completedTypes,
        _activityTypeCount = activityTypeCount;

  factory _$LearningProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningProgressImplFromJson(json);

  @override
  final int totalActivities;
  @override
  final int completedActivities;
  @override
  final double averageScore;
  final List<String> _completedTypes;
  @override
  List<String> get completedTypes {
    if (_completedTypes is EqualUnmodifiableListView) return _completedTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedTypes);
  }

  final Map<String, int> _activityTypeCount;
  @override
  Map<String, int> get activityTypeCount {
    if (_activityTypeCount is EqualUnmodifiableMapView)
      return _activityTypeCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activityTypeCount);
  }

  @override
  String toString() {
    return 'LearningProgress(totalActivities: $totalActivities, completedActivities: $completedActivities, averageScore: $averageScore, completedTypes: $completedTypes, activityTypeCount: $activityTypeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningProgressImpl &&
            (identical(other.totalActivities, totalActivities) ||
                other.totalActivities == totalActivities) &&
            (identical(other.completedActivities, completedActivities) ||
                other.completedActivities == completedActivities) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            const DeepCollectionEquality()
                .equals(other._completedTypes, _completedTypes) &&
            const DeepCollectionEquality()
                .equals(other._activityTypeCount, _activityTypeCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalActivities,
      completedActivities,
      averageScore,
      const DeepCollectionEquality().hash(_completedTypes),
      const DeepCollectionEquality().hash(_activityTypeCount));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningProgressImplCopyWith<_$LearningProgressImpl> get copyWith =>
      __$$LearningProgressImplCopyWithImpl<_$LearningProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningProgressImplToJson(
      this,
    );
  }
}

abstract class _LearningProgress implements LearningProgress {
  const factory _LearningProgress(
          {required final int totalActivities,
          required final int completedActivities,
          required final double averageScore,
          required final List<String> completedTypes,
          required final Map<String, int> activityTypeCount}) =
      _$LearningProgressImpl;

  factory _LearningProgress.fromJson(Map<String, dynamic> json) =
      _$LearningProgressImpl.fromJson;

  @override
  int get totalActivities;
  @override
  int get completedActivities;
  @override
  double get averageScore;
  @override
  List<String> get completedTypes;
  @override
  Map<String, int> get activityTypeCount;
  @override
  @JsonKey(ignore: true)
  _$$LearningProgressImplCopyWith<_$LearningProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
