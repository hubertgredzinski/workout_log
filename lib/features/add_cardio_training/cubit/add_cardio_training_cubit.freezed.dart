// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_cardio_training_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddCardioTrainingState {
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCardioTrainingStateCopyWith<AddCardioTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCardioTrainingStateCopyWith<$Res> {
  factory $AddCardioTrainingStateCopyWith(AddCardioTrainingState value,
          $Res Function(AddCardioTrainingState) then) =
      _$AddCardioTrainingStateCopyWithImpl<$Res, AddCardioTrainingState>;
  @useResult
  $Res call({Status status, String? errorMessage});
}

/// @nodoc
class _$AddCardioTrainingStateCopyWithImpl<$Res,
        $Val extends AddCardioTrainingState>
    implements $AddCardioTrainingStateCopyWith<$Res> {
  _$AddCardioTrainingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddStrengthTrainingStateCopyWith<$Res>
    implements $AddCardioTrainingStateCopyWith<$Res> {
  factory _$$_AddStrengthTrainingStateCopyWith(
          _$_AddStrengthTrainingState value,
          $Res Function(_$_AddStrengthTrainingState) then) =
      __$$_AddStrengthTrainingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? errorMessage});
}

/// @nodoc
class __$$_AddStrengthTrainingStateCopyWithImpl<$Res>
    extends _$AddCardioTrainingStateCopyWithImpl<$Res,
        _$_AddStrengthTrainingState>
    implements _$$_AddStrengthTrainingStateCopyWith<$Res> {
  __$$_AddStrengthTrainingStateCopyWithImpl(_$_AddStrengthTrainingState _value,
      $Res Function(_$_AddStrengthTrainingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddStrengthTrainingState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AddStrengthTrainingState implements _AddStrengthTrainingState {
  _$_AddStrengthTrainingState(
      {this.status = Status.initial, this.errorMessage});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddCardioTrainingState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddStrengthTrainingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddStrengthTrainingStateCopyWith<_$_AddStrengthTrainingState>
      get copyWith => __$$_AddStrengthTrainingStateCopyWithImpl<
          _$_AddStrengthTrainingState>(this, _$identity);
}

abstract class _AddStrengthTrainingState implements AddCardioTrainingState {
  factory _AddStrengthTrainingState(
      {final Status status,
      final String? errorMessage}) = _$_AddStrengthTrainingState;

  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddStrengthTrainingStateCopyWith<_$_AddStrengthTrainingState>
      get copyWith => throw _privateConstructorUsedError;
}
