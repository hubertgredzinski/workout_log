// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strength_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StrengthHistoryModel {
  String? get bodypart => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get exercise => throw _privateConstructorUsedError;
  String get reps => throw _privateConstructorUsedError;
  String get sets => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StrengthHistoryModelCopyWith<StrengthHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrengthHistoryModelCopyWith<$Res> {
  factory $StrengthHistoryModelCopyWith(StrengthHistoryModel value,
          $Res Function(StrengthHistoryModel) then) =
      _$StrengthHistoryModelCopyWithImpl<$Res, StrengthHistoryModel>;
  @useResult
  $Res call(
      {String? bodypart,
      DateTime date,
      String exercise,
      String reps,
      String sets,
      String? weight,
      String id});
}

/// @nodoc
class _$StrengthHistoryModelCopyWithImpl<$Res,
        $Val extends StrengthHistoryModel>
    implements $StrengthHistoryModelCopyWith<$Res> {
  _$StrengthHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodypart = freezed,
    Object? date = null,
    Object? exercise = null,
    Object? reps = null,
    Object? sets = null,
    Object? weight = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      bodypart: freezed == bodypart
          ? _value.bodypart
          : bodypart // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as String,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StrengthHistoryModelCopyWith<$Res>
    implements $StrengthHistoryModelCopyWith<$Res> {
  factory _$$_StrengthHistoryModelCopyWith(_$_StrengthHistoryModel value,
          $Res Function(_$_StrengthHistoryModel) then) =
      __$$_StrengthHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bodypart,
      DateTime date,
      String exercise,
      String reps,
      String sets,
      String? weight,
      String id});
}

/// @nodoc
class __$$_StrengthHistoryModelCopyWithImpl<$Res>
    extends _$StrengthHistoryModelCopyWithImpl<$Res, _$_StrengthHistoryModel>
    implements _$$_StrengthHistoryModelCopyWith<$Res> {
  __$$_StrengthHistoryModelCopyWithImpl(_$_StrengthHistoryModel _value,
      $Res Function(_$_StrengthHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodypart = freezed,
    Object? date = null,
    Object? exercise = null,
    Object? reps = null,
    Object? sets = null,
    Object? weight = freezed,
    Object? id = null,
  }) {
    return _then(_$_StrengthHistoryModel(
      bodypart: freezed == bodypart
          ? _value.bodypart
          : bodypart // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exercise: null == exercise
          ? _value.exercise
          : exercise // ignore: cast_nullable_to_non_nullable
              as String,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as String,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StrengthHistoryModel extends _StrengthHistoryModel {
  _$_StrengthHistoryModel(
      {required this.bodypart,
      required this.date,
      required this.exercise,
      required this.reps,
      required this.sets,
      required this.weight,
      required this.id})
      : super._();

  @override
  final String? bodypart;
  @override
  final DateTime date;
  @override
  final String exercise;
  @override
  final String reps;
  @override
  final String sets;
  @override
  final String? weight;
  @override
  final String id;

  @override
  String toString() {
    return 'StrengthHistoryModel(bodypart: $bodypart, date: $date, exercise: $exercise, reps: $reps, sets: $sets, weight: $weight, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StrengthHistoryModel &&
            (identical(other.bodypart, bodypart) ||
                other.bodypart == bodypart) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.exercise, exercise) ||
                other.exercise == exercise) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bodypart, date, exercise, reps, sets, weight, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StrengthHistoryModelCopyWith<_$_StrengthHistoryModel> get copyWith =>
      __$$_StrengthHistoryModelCopyWithImpl<_$_StrengthHistoryModel>(
          this, _$identity);
}

abstract class _StrengthHistoryModel extends StrengthHistoryModel {
  factory _StrengthHistoryModel(
      {required final String? bodypart,
      required final DateTime date,
      required final String exercise,
      required final String reps,
      required final String sets,
      required final String? weight,
      required final String id}) = _$_StrengthHistoryModel;
  _StrengthHistoryModel._() : super._();

  @override
  String? get bodypart;
  @override
  DateTime get date;
  @override
  String get exercise;
  @override
  String get reps;
  @override
  String get sets;
  @override
  String? get weight;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_StrengthHistoryModelCopyWith<_$_StrengthHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
