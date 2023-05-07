// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strength_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StrengthHistoryState {
  List<StrengthHistoryModel> get strengthDocuments =>
      throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StrengthHistoryStateCopyWith<StrengthHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrengthHistoryStateCopyWith<$Res> {
  factory $StrengthHistoryStateCopyWith(StrengthHistoryState value,
          $Res Function(StrengthHistoryState) then) =
      _$StrengthHistoryStateCopyWithImpl<$Res, StrengthHistoryState>;
  @useResult
  $Res call(
      {List<StrengthHistoryModel> strengthDocuments,
      Status status,
      String? errorMessage});
}

/// @nodoc
class _$StrengthHistoryStateCopyWithImpl<$Res,
        $Val extends StrengthHistoryState>
    implements $StrengthHistoryStateCopyWith<$Res> {
  _$StrengthHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strengthDocuments = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      strengthDocuments: null == strengthDocuments
          ? _value.strengthDocuments
          : strengthDocuments // ignore: cast_nullable_to_non_nullable
              as List<StrengthHistoryModel>,
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
abstract class _$$_StrengthHistoryStateCopyWith<$Res>
    implements $StrengthHistoryStateCopyWith<$Res> {
  factory _$$_StrengthHistoryStateCopyWith(_$_StrengthHistoryState value,
          $Res Function(_$_StrengthHistoryState) then) =
      __$$_StrengthHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StrengthHistoryModel> strengthDocuments,
      Status status,
      String? errorMessage});
}

/// @nodoc
class __$$_StrengthHistoryStateCopyWithImpl<$Res>
    extends _$StrengthHistoryStateCopyWithImpl<$Res, _$_StrengthHistoryState>
    implements _$$_StrengthHistoryStateCopyWith<$Res> {
  __$$_StrengthHistoryStateCopyWithImpl(_$_StrengthHistoryState _value,
      $Res Function(_$_StrengthHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strengthDocuments = null,
    Object? status = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_StrengthHistoryState(
      strengthDocuments: null == strengthDocuments
          ? _value._strengthDocuments
          : strengthDocuments // ignore: cast_nullable_to_non_nullable
              as List<StrengthHistoryModel>,
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

class _$_StrengthHistoryState implements _StrengthHistoryState {
  _$_StrengthHistoryState(
      {final List<StrengthHistoryModel> strengthDocuments = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _strengthDocuments = strengthDocuments;

  final List<StrengthHistoryModel> _strengthDocuments;
  @override
  @JsonKey()
  List<StrengthHistoryModel> get strengthDocuments {
    if (_strengthDocuments is EqualUnmodifiableListView)
      return _strengthDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengthDocuments);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'StrengthHistoryState(strengthDocuments: $strengthDocuments, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StrengthHistoryState &&
            const DeepCollectionEquality()
                .equals(other._strengthDocuments, _strengthDocuments) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_strengthDocuments),
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StrengthHistoryStateCopyWith<_$_StrengthHistoryState> get copyWith =>
      __$$_StrengthHistoryStateCopyWithImpl<_$_StrengthHistoryState>(
          this, _$identity);
}

abstract class _StrengthHistoryState implements StrengthHistoryState {
  factory _StrengthHistoryState(
      {final List<StrengthHistoryModel> strengthDocuments,
      final Status status,
      final String? errorMessage}) = _$_StrengthHistoryState;

  @override
  List<StrengthHistoryModel> get strengthDocuments;
  @override
  Status get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_StrengthHistoryStateCopyWith<_$_StrengthHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
