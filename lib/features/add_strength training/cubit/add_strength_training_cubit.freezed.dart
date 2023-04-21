// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_strength_training_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddStrengthTrainingState {
  dynamic get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStrengthTrainingStateCopyWith<AddStrengthTrainingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStrengthTrainingStateCopyWith<$Res> {
  factory $AddStrengthTrainingStateCopyWith(AddStrengthTrainingState value,
          $Res Function(AddStrengthTrainingState) then) =
      _$AddStrengthTrainingStateCopyWithImpl<$Res, AddStrengthTrainingState>;
  @useResult
  $Res call({dynamic status, String? errorMessage});
}

/// @nodoc
class _$AddStrengthTrainingStateCopyWithImpl<$Res,
        $Val extends AddStrengthTrainingState>
    implements $AddStrengthTrainingStateCopyWith<$Res> {
  _$AddStrengthTrainingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddStrengthTrainingStateCopyWith<$Res>
    implements $AddStrengthTrainingStateCopyWith<$Res> {
  factory _$$_AddStrengthTrainingStateCopyWith(
          _$_AddStrengthTrainingState value,
          $Res Function(_$_AddStrengthTrainingState) then) =
      __$$_AddStrengthTrainingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic status, String? errorMessage});
}

/// @nodoc
class __$$_AddStrengthTrainingStateCopyWithImpl<$Res>
    extends _$AddStrengthTrainingStateCopyWithImpl<$Res,
        _$_AddStrengthTrainingState>
    implements _$$_AddStrengthTrainingStateCopyWith<$Res> {
  __$$_AddStrengthTrainingStateCopyWithImpl(_$_AddStrengthTrainingState _value,
      $Res Function(_$_AddStrengthTrainingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_AddStrengthTrainingState(
      status: freezed == status ? _value.status! : status,
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
  final dynamic status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AddStrengthTrainingState(status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddStrengthTrainingState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(status), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddStrengthTrainingStateCopyWith<_$_AddStrengthTrainingState>
      get copyWith => __$$_AddStrengthTrainingStateCopyWithImpl<
          _$_AddStrengthTrainingState>(this, _$identity);
}

abstract class _AddStrengthTrainingState implements AddStrengthTrainingState {
  factory _AddStrengthTrainingState(
      {final dynamic status,
      final String? errorMessage}) = _$_AddStrengthTrainingState;

  @override
  dynamic get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_AddStrengthTrainingStateCopyWith<_$_AddStrengthTrainingState>
      get copyWith => throw _privateConstructorUsedError;
}
