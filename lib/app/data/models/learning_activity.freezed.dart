// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LearningActivity _$LearningActivityFromJson(Map<String, dynamic> json) {
  return _LearningActivity.fromJson(json);
}

/// @nodoc
mixin _$LearningActivity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this LearningActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearningActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearningActivityCopyWith<LearningActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningActivityCopyWith<$Res> {
  factory $LearningActivityCopyWith(
    LearningActivity value,
    $Res Function(LearningActivity) then,
  ) = _$LearningActivityCopyWithImpl<$Res, LearningActivity>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String type,
    bool completed,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$LearningActivityCopyWithImpl<$Res, $Val extends LearningActivity>
    implements $LearningActivityCopyWith<$Res> {
  _$LearningActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearningActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            completed:
                null == completed
                    ? _value.completed
                    : completed // ignore: cast_nullable_to_non_nullable
                        as bool,
            completedAt:
                freezed == completedAt
                    ? _value.completedAt
                    : completedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LearningActivityImplCopyWith<$Res>
    implements $LearningActivityCopyWith<$Res> {
  factory _$$LearningActivityImplCopyWith(
    _$LearningActivityImpl value,
    $Res Function(_$LearningActivityImpl) then,
  ) = __$$LearningActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String type,
    bool completed,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$LearningActivityImplCopyWithImpl<$Res>
    extends _$LearningActivityCopyWithImpl<$Res, _$LearningActivityImpl>
    implements _$$LearningActivityImplCopyWith<$Res> {
  __$$LearningActivityImplCopyWithImpl(
    _$LearningActivityImpl _value,
    $Res Function(_$LearningActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LearningActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? completed = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$LearningActivityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        completed:
            null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                    as bool,
        completedAt:
            freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningActivityImpl implements _LearningActivity {
  const _$LearningActivityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.completed,
    this.completedAt,
  });

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
  final bool completed;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'LearningActivity(id: $id, title: $title, description: $description, type: $type, completed: $completed, completedAt: $completedAt)';
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
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    type,
    completed,
    completedAt,
  );

  /// Create a copy of LearningActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningActivityImplCopyWith<_$LearningActivityImpl> get copyWith =>
      __$$LearningActivityImplCopyWithImpl<_$LearningActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningActivityImplToJson(this);
  }
}

abstract class _LearningActivity implements LearningActivity {
  const factory _LearningActivity({
    required final String id,
    required final String title,
    required final String description,
    required final String type,
    required final bool completed,
    final DateTime? completedAt,
  }) = _$LearningActivityImpl;

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
  bool get completed;
  @override
  DateTime? get completedAt;

  /// Create a copy of LearningActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearningActivityImplCopyWith<_$LearningActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
