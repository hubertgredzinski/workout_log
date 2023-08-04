// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesModel {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesModelCopyWith<NotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesModelCopyWith<$Res> {
  factory $NotesModelCopyWith(
          NotesModel value, $Res Function(NotesModel) then) =
      _$NotesModelCopyWithImpl<$Res, NotesModel>;
  @useResult
  $Res call({String title, String id});
}

/// @nodoc
class _$NotesModelCopyWithImpl<$Res, $Val extends NotesModel>
    implements $NotesModelCopyWith<$Res> {
  _$NotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotesModelCopyWith<$Res>
    implements $NotesModelCopyWith<$Res> {
  factory _$$_NotesModelCopyWith(
          _$_NotesModel value, $Res Function(_$_NotesModel) then) =
      __$$_NotesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String id});
}

/// @nodoc
class __$$_NotesModelCopyWithImpl<$Res>
    extends _$NotesModelCopyWithImpl<$Res, _$_NotesModel>
    implements _$$_NotesModelCopyWith<$Res> {
  __$$_NotesModelCopyWithImpl(
      _$_NotesModel _value, $Res Function(_$_NotesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
  }) {
    return _then(_$_NotesModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NotesModel extends _NotesModel {
  _$_NotesModel({required this.title, required this.id}) : super._();

  @override
  final String title;
  @override
  final String id;

  @override
  String toString() {
    return 'NotesModel(title: $title, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotesModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotesModelCopyWith<_$_NotesModel> get copyWith =>
      __$$_NotesModelCopyWithImpl<_$_NotesModel>(this, _$identity);
}

abstract class _NotesModel extends NotesModel {
  factory _NotesModel({required final String title, required final String id}) =
      _$_NotesModel;
  _NotesModel._() : super._();

  @override
  String get title;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_NotesModelCopyWith<_$_NotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
