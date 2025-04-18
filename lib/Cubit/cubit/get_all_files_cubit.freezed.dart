// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_files_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllFilesState {
  Status get status => throw _privateConstructorUsedError;
  Failure get failure => throw _privateConstructorUsedError;
  List<AllFilesModel> get allFiles => throw _privateConstructorUsedError;

  /// Create a copy of GetAllFilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAllFilesStateCopyWith<GetAllFilesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllFilesStateCopyWith<$Res> {
  factory $GetAllFilesStateCopyWith(
          GetAllFilesState value, $Res Function(GetAllFilesState) then) =
      _$GetAllFilesStateCopyWithImpl<$Res, GetAllFilesState>;
  @useResult
  $Res call({Status status, Failure failure, List<AllFilesModel> allFiles});
}

/// @nodoc
class _$GetAllFilesStateCopyWithImpl<$Res, $Val extends GetAllFilesState>
    implements $GetAllFilesStateCopyWith<$Res> {
  _$GetAllFilesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAllFilesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = null,
    Object? allFiles = null,
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
      allFiles: null == allFiles
          ? _value.allFiles
          : allFiles // ignore: cast_nullable_to_non_nullable
              as List<AllFilesModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllFilesStateImplCopyWith<$Res>
    implements $GetAllFilesStateCopyWith<$Res> {
  factory _$$GetAllFilesStateImplCopyWith(_$GetAllFilesStateImpl value,
          $Res Function(_$GetAllFilesStateImpl) then) =
      __$$GetAllFilesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, Failure failure, List<AllFilesModel> allFiles});
}

/// @nodoc
class __$$GetAllFilesStateImplCopyWithImpl<$Res>
    extends _$GetAllFilesStateCopyWithImpl<$Res, _$GetAllFilesStateImpl>
    implements _$$GetAllFilesStateImplCopyWith<$Res> {
  __$$GetAllFilesStateImplCopyWithImpl(_$GetAllFilesStateImpl _value,
      $Res Function(_$GetAllFilesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAllFilesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = null,
    Object? allFiles = null,
  }) {
    return _then(_$GetAllFilesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      allFiles: null == allFiles
          ? _value._allFiles
          : allFiles // ignore: cast_nullable_to_non_nullable
              as List<AllFilesModel>,
    ));
  }
}

/// @nodoc

class _$GetAllFilesStateImpl implements _GetAllFilesState {
  const _$GetAllFilesStateImpl(
      {this.status = Status.UNKNOWN,
      this.failure = const UnknownFailure(),
      final List<AllFilesModel> allFiles = const []})
      : _allFiles = allFiles;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Failure failure;
  final List<AllFilesModel> _allFiles;
  @override
  @JsonKey()
  List<AllFilesModel> get allFiles {
    if (_allFiles is EqualUnmodifiableListView) return _allFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allFiles);
  }

  @override
  String toString() {
    return 'GetAllFilesState(status: $status, failure: $failure, allFiles: $allFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllFilesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality().equals(other._allFiles, _allFiles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, failure,
      const DeepCollectionEquality().hash(_allFiles));

  /// Create a copy of GetAllFilesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllFilesStateImplCopyWith<_$GetAllFilesStateImpl> get copyWith =>
      __$$GetAllFilesStateImplCopyWithImpl<_$GetAllFilesStateImpl>(
          this, _$identity);
}

abstract class _GetAllFilesState implements GetAllFilesState {
  const factory _GetAllFilesState(
      {final Status status,
      final Failure failure,
      final List<AllFilesModel> allFiles}) = _$GetAllFilesStateImpl;

  @override
  Status get status;
  @override
  Failure get failure;
  @override
  List<AllFilesModel> get allFiles;

  /// Create a copy of GetAllFilesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllFilesStateImplCopyWith<_$GetAllFilesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
