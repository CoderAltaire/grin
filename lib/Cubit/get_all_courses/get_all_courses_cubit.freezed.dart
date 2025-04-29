// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_courses_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllCoursesState {
  Status get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  AllCourses? get allCourses => throw _privateConstructorUsedError;

  /// Create a copy of GetAllCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllCoursesStateCopyWith<GetAllCoursesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCoursesStateCopyWith<$Res> {
  factory $GetAllCoursesStateCopyWith(
          GetAllCoursesState value, $Res Function(GetAllCoursesState) then) =
      _$GetAllCoursesStateCopyWithImpl<$Res, GetAllCoursesState>;
  @useResult
  $Res call({Status status, Failure failure, AllCourses? allCourses});
}

/// @nodoc
class _$GetAllCoursesStateCopyWithImpl<$Res, $Val extends GetAllCoursesState>
    implements $GetAllCoursesStateCopyWith<$Res> {
  _$GetAllCoursesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = null,
    Object? allCourses = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      allCourses: freezed == allCourses
          ? _value.allCourses
          : allCourses // ignore: cast_nullable_to_non_nullable
              as AllCourses?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllCoursesStateImplCopyWith<$Res>
    implements $GetAllCoursesStateCopyWith<$Res> {
  factory _$$GetAllCoursesStateImplCopyWith(_$GetAllCoursesStateImpl value,
          $Res Function(_$GetAllCoursesStateImpl) then) =
      __$$GetAllCoursesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Failure failure, AllCourses? allCourses});
}

/// @nodoc
class __$$GetAllCoursesStateImplCopyWithImpl<$Res>
    extends _$GetAllCoursesStateCopyWithImpl<$Res, _$GetAllCoursesStateImpl>
    implements _$$GetAllCoursesStateImplCopyWith<$Res> {
  __$$GetAllCoursesStateImplCopyWithImpl(_$GetAllCoursesStateImpl _value,
      $Res Function(_$GetAllCoursesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = null,
    Object? allCourses = freezed,
  }) {
    return _then(_$GetAllCoursesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      allCourses: freezed == allCourses
          ? _value.allCourses
          : allCourses // ignore: cast_nullable_to_non_nullable
              as AllCourses?,
    ));
  }
}

/// @nodoc

class _$GetAllCoursesStateImpl implements _GetAllCoursesState {
  const _$GetAllCoursesStateImpl(
      {this.status = Status.UNKNOWN,
      this.failure = const UnknownFailure(),
      this.allCourses});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Failure failure;
  @override
  final AllCourses? allCourses;

  @override
  String toString() {
    return 'GetAllCoursesState(status: $status, failure: $failure, allCourses: $allCourses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCoursesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.allCourses, allCourses) ||
                other.allCourses == allCourses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure, allCourses);

  /// Create a copy of GetAllCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCoursesStateImplCopyWith<_$GetAllCoursesStateImpl> get copyWith =>
      __$$GetAllCoursesStateImplCopyWithImpl<_$GetAllCoursesStateImpl>(
          this, _$identity);
}

abstract class _GetAllCoursesState implements GetAllCoursesState {
  const factory _GetAllCoursesState(
      {final Status status,
      final Failure failure,
      final AllCourses? allCourses}) = _$GetAllCoursesStateImpl;

  @override
  Status get status;
  @override
  Failure get failure;
  @override
  AllCourses? get allCourses;

  /// Create a copy of GetAllCoursesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCoursesStateImplCopyWith<_$GetAllCoursesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
