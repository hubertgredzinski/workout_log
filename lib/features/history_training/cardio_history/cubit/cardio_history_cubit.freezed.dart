// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardioHistoryState {
  List<CardioHistoryModel> get cardioDocuments =>
      throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardioHistoryStateCopyWith<CardioHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardioHistoryStateCopyWith<$Res> {
  factory $CardioHistoryStateCopyWith(
          CardioHistoryState value, $Res Function(CardioHistoryState) then) =
      _$CardioHistoryStateCopyWithImpl<$Res, CardioHistoryState>;
  @useResult
  $Res call(
      {List<CardioHistoryModel> cardioDocuments,
      dynamic status,
      String? errorMessage});
}

/// @nodoc
class _$CardioHistoryStateCopyWithImpl<$Res, $Val extends CardioHistoryState>
    implements $CardioHistoryStateCopyWith<$Res> {
  _$CardioHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardioDocuments = null,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      cardioDocuments: null == cardioDocuments
          ? _value.cardioDocuments
          : cardioDocuments // ignore: cast_nullable_to_non_nullable
              as List<CardioHistoryModel>,
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
abstract class _$$_CardioHistoryStateCopyWith<$Res>
    implements $CardioHistoryStateCopyWith<$Res> {
  factory _$$_CardioHistoryStateCopyWith(_$_CardioHistoryState value,
          $Res Function(_$_CardioHistoryState) then) =
      __$$_CardioHistoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CardioHistoryModel> cardioDocuments,
      dynamic status,
      String? errorMessage});
}

/// @nodoc
class __$$_CardioHistoryStateCopyWithImpl<$Res>
    extends _$CardioHistoryStateCopyWithImpl<$Res, _$_CardioHistoryState>
    implements _$$_CardioHistoryStateCopyWith<$Res> {
  __$$_CardioHistoryStateCopyWithImpl(
      _$_CardioHistoryState _value, $Res Function(_$_CardioHistoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardioDocuments = null,
    Object? status = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_CardioHistoryState(
      cardioDocuments: null == cardioDocuments
          ? _value._cardioDocuments
          : cardioDocuments // ignore: cast_nullable_to_non_nullable
              as List<CardioHistoryModel>,
      status: freezed == status ? _value.status! : status,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CardioHistoryState implements _CardioHistoryState {
  _$_CardioHistoryState(
      {final List<CardioHistoryModel> cardioDocuments = const [],
      this.status = Status.initial,
      this.errorMessage})
      : _cardioDocuments = cardioDocuments;

  final List<CardioHistoryModel> _cardioDocuments;
  @override
  @JsonKey()
  List<CardioHistoryModel> get cardioDocuments {
    if (_cardioDocuments is EqualUnmodifiableListView) return _cardioDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardioDocuments);
  }

  @override
  @JsonKey()
  final dynamic status;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CardioHistoryState(cardioDocuments: $cardioDocuments, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardioHistoryState &&
            const DeepCollectionEquality()
                .equals(other._cardioDocuments, _cardioDocuments) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cardioDocuments),
      const DeepCollectionEquality().hash(status),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardioHistoryStateCopyWith<_$_CardioHistoryState> get copyWith =>
      __$$_CardioHistoryStateCopyWithImpl<_$_CardioHistoryState>(
          this, _$identity);
}

abstract class _CardioHistoryState implements CardioHistoryState {
  factory _CardioHistoryState(
      {final List<CardioHistoryModel> cardioDocuments,
      final dynamic status,
      final String? errorMessage}) = _$_CardioHistoryState;

  @override
  List<CardioHistoryModel> get cardioDocuments;
  @override
  dynamic get status;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CardioHistoryStateCopyWith<_$_CardioHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
