// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cardio_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardioHistoryModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get intensity => throw _privateConstructorUsedError;
  String? get kcal => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardioHistoryModelCopyWith<CardioHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardioHistoryModelCopyWith<$Res> {
  factory $CardioHistoryModelCopyWith(
          CardioHistoryModel value, $Res Function(CardioHistoryModel) then) =
      _$CardioHistoryModelCopyWithImpl<$Res, CardioHistoryModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      String time,
      DateTime date,
      String? intensity,
      String? kcal,
      String? distance});
}

/// @nodoc
class _$CardioHistoryModelCopyWithImpl<$Res, $Val extends CardioHistoryModel>
    implements $CardioHistoryModelCopyWith<$Res> {
  _$CardioHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? time = null,
    Object? date = null,
    Object? intensity = freezed,
    Object? kcal = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intensity: freezed == intensity
          ? _value.intensity
          : intensity // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardioHistoryModelCopyWith<$Res>
    implements $CardioHistoryModelCopyWith<$Res> {
  factory _$$_CardioHistoryModelCopyWith(_$_CardioHistoryModel value,
          $Res Function(_$_CardioHistoryModel) then) =
      __$$_CardioHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String time,
      DateTime date,
      String? intensity,
      String? kcal,
      String? distance});
}

/// @nodoc
class __$$_CardioHistoryModelCopyWithImpl<$Res>
    extends _$CardioHistoryModelCopyWithImpl<$Res, _$_CardioHistoryModel>
    implements _$$_CardioHistoryModelCopyWith<$Res> {
  __$$_CardioHistoryModelCopyWithImpl(
      _$_CardioHistoryModel _value, $Res Function(_$_CardioHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? time = null,
    Object? date = null,
    Object? intensity = freezed,
    Object? kcal = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$_CardioHistoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      intensity: freezed == intensity
          ? _value.intensity
          : intensity // ignore: cast_nullable_to_non_nullable
              as String?,
      kcal: freezed == kcal
          ? _value.kcal
          : kcal // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CardioHistoryModel extends _CardioHistoryModel {
  _$_CardioHistoryModel(
      {required this.id,
      required this.type,
      required this.time,
      required this.date,
      required this.intensity,
      required this.kcal,
      required this.distance})
      : super._();

  @override
  final String id;
  @override
  final String type;
  @override
  final String time;
  @override
  final DateTime date;
  @override
  final String? intensity;
  @override
  final String? kcal;
  @override
  final String? distance;

  @override
  String toString() {
    return 'CardioHistoryModel(id: $id, type: $type, time: $time, date: $date, intensity: $intensity, kcal: $kcal, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardioHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.intensity, intensity) ||
                other.intensity == intensity) &&
            (identical(other.kcal, kcal) || other.kcal == kcal) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, time, date, intensity, kcal, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardioHistoryModelCopyWith<_$_CardioHistoryModel> get copyWith =>
      __$$_CardioHistoryModelCopyWithImpl<_$_CardioHistoryModel>(
          this, _$identity);
}

abstract class _CardioHistoryModel extends CardioHistoryModel {
  factory _CardioHistoryModel(
      {required final String id,
      required final String type,
      required final String time,
      required final DateTime date,
      required final String? intensity,
      required final String? kcal,
      required final String? distance}) = _$_CardioHistoryModel;
  _CardioHistoryModel._() : super._();

  @override
  String get id;
  @override
  String get type;
  @override
  String get time;
  @override
  DateTime get date;
  @override
  String? get intensity;
  @override
  String? get kcal;
  @override
  String? get distance;
  @override
  @JsonKey(ignore: true)
  _$$_CardioHistoryModelCopyWith<_$_CardioHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
