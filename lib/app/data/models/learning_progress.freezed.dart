// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LearningProgress _$LearningProgressFromJson(Map<String, dynamic> json) {
  return _LearningProgress.fromJson(json);
}

/// @nodoc
mixin _$LearningProgress {
  int get totalActivities => throw _privateConstructorUsedError;
  int get completedActivities => throw _privateConstructorUsedError;
  double get progressPercentage => throw _privateConstructorUsedError;

  /// Serializes this LearningProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningProgressCopyWith<LearningProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningProgressCopyWith<$Res> {
  factory $LearningProgressCopyWith(
    LearningProgress value,
    $Res Function(LearningProgress) then,
  ) = _$LearningProgressCopyWithImpl<$Res, LearningProgress>;
  @useResult
  $Res call({
    int totalActivities,
    int completedActivities,
    double progressPercentage,
  });
}

/// @nodoc
class _$LearningProgressCopyWithImpl<$Res, $Val extends LearningProgress>
    implements $LearningProgressCopyWith<$Res> {
  _$LearningProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? progressPercentage = null,
  }) {
    return _then(
      _value.copyWith(
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
            progressPercentage:
                null == progressPercentage
                    ? _value.progressPercentage
                    : progressPercentage // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LearningProgressImplCopyWith<$Res>
    implements $LearningProgressCopyWith<$Res> {
  factory _$$LearningProgressImplCopyWith(
    _$LearningProgressImpl value,
    $Res Function(_$LearningProgressImpl) then,
  ) = __$$LearningProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalActivities,
    int completedActivities,
    double progressPercentage,
  });
}

/// @nodoc
class __$$LearningProgressImplCopyWithImpl<$Res>
    extends _$LearningProgressCopyWithImpl<$Res, _$LearningProgressImpl>
    implements _$$LearningProgressImplCopyWith<$Res> {
  __$$LearningProgressImplCopyWithImpl(
    _$LearningProgressImpl _value,
    $Res Function(_$LearningProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LearningProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalActivities = null,
    Object? completedActivities = null,
    Object? progressPercentage = null,
  }) {
    return _then(
      _$LearningProgressImpl(
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
        progressPercentage:
            null == progressPercentage
                ? _value.progressPercentage
                : progressPercentage // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningProgressImpl implements _LearningProgress {
  const _$LearningProgressImpl({
    required this.totalActivities,
    required this.completedActivities,
    required this.progressPercentage,
  });

  factory _$LearningProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningProgressImplFromJson(json);

  @override
  final int totalActivities;
  @override
  final int completedActivities;
  @override
  final double progressPercentage;

  @override
  String toString() {
    return 'LearningProgress(totalActivities: $totalActivities, completedActivities: $completedActivities, progressPercentage: $progressPercentage)';
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
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalActivities,
    completedActivities,
    progressPercentage,
  );

  /// Create a copy of LearningProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningProgressImplCopyWith<_$LearningProgressImpl> get copyWith =>
      __$$LearningProgressImplCopyWithImpl<_$LearningProgressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningProgressImplToJson(this);
  }
}

abstract class _LearningProgress implements LearningProgress {
  const factory _LearningProgress({
    required final int totalActivities,
    required final int completedActivities,
    required final double progressPercentage,
  }) = _$LearningProgressImpl;

  factory _LearningProgress.fromJson(Map<String, dynamic> json) =
      _$LearningProgressImpl.fromJson;

  @override
  int get totalActivities;
  @override
  int get completedActivities;
  @override
  double get progressPercentage;

  /// Create a copy of LearningProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningProgressImplCopyWith<_$LearningProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
